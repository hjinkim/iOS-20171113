// 7_AutoReleasePool.m
#import <Foundation/Foundation.h>

#if 0
// 함수를 통해서 할당된 자원을 반환하고 싶다.
//   * C언어
//    1) static / 전역 변수                    => strtok / strtok_r
//       => 재진입(재귀, 스레드 안전성)이 불가능하다.
//    2) malloc                             => strdup
//       => free를 하지 않으면 누수가 발생한다.
struct Car {};
struct Car* foo()
{
    // static struct Car c;
    // return &c;
    return malloc(sizeof(struct Car));
}
#endif

@interface Car : NSObject {
    int _color;
}

- (instancetype)initWithRed:(int)red
                      green:(int)green
                       blue:(int)blue;

+ (Car*)blueCar;
+ (Car*)redCar;

@end

@implementation Car

- (void)dealloc {
    printf("dealloc\n");
    [super dealloc];
}

// 아래의 redCar / blueCar 같은 정적 메소드
//  ObjC: 편의 생성자
//  Java: static factory method

// ARC에서는 함수를 통해서 반환되는 모든 객체는 자동 해체풀에 자동 등록됩니다.

+ (Car*)redCar {
    return [[[Car alloc] initWithRed:255
                               green:0
                                blue: 0] autorelease];
}

+ (Car*)blueCar {
    Car* p = [[Car alloc] initWithRed:0 green:0 blue:255];
    [p autorelease]; // 객체를 자동 해체 풀에 등록한다.
    return p;
}

- (instancetype)initWithRed:(int)red
                      green:(int)green
                       blue:(int)blue {
    self = [super init];
    if (self) {
        // ...
    }
    
    return self;
}

@end

void foo(Car* p)
{
    // ...
}

// 만약 goo 함수 안에서 함수를 통해서 생성되는 객체가 많다.
void goo() {
    @autoreleasepool {

    }
}

// 함수를 통해서 생성되는 객체의 파괴는 자동 해체 풀이 담당한다.
//  => 반드시 프로그램 내에 한 개 이상의 [자동 해체 풀]이 존재해야 한다.

int main()
{
    // NSAutoreleasePool* pool = [NSAutoreleasePool new];
    @autoreleasepool {
        foo([Car blueCar]);
    }
    // [pool release]; // pool에 등록된 모든 객체의 참조 계수를 1 감소한다.
    
    // 편의 생성자: 내부적으로 지정 초기화 메소드를 통해 객체를 생성하는 정적 메소드
    // Car* p1 = [Car redCar];
    // Car* p2 = [Car blueCar];
}




















