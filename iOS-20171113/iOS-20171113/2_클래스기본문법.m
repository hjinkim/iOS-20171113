//  2_클래스기본문법.m
#import <Foundation/Foundation.h>

// 1. ObjC는 스몰토크의 영향을 받았습니다.
//   : 다른 객체 지향 언어와 용어가 다소 다릅니다.

// 2. @ 기호가 C 문법의 확장 => ObjC 문법

// 3. ObjC의 모든 객체는 반드시 힙에 생성되어야 합니다.
//   1) Car* p = new Car();            // C++
//   2) Car* p = [Car new];            // ObjC
//               [receiver selector];

// 선언 - Car.h
// : ObjC의 모든 클래스는 반드시 NSObject의 자식이어야 합니다.

// 4. 인스턴스 변수를 만들고, 접근 지정자를 사용하는 방법
// 5. 메소드를 만들고 호출하는 방법.
@interface Car: NSObject {
@protected      // default
@private
@public
    int speed;
    int color;
}

// -: instance method
// +: class method
// (return-type)method_name
// void go();
- (void)go;
+ (void)ho;

@end

// 정의 - Car.m
@implementation Car

- (void)go {
    printf("go\n");
}

+ (void)ho {
    printf("ho\n");
}

@end

int main()
{
    Car* p = [Car new];
    p->speed = 42;
    
    printf("%d\n", p->speed);
    
    // go: instance method
    [p go];
    
    // ho: class method
    [Car ho];
}























