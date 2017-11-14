//  4_셀렉터.m
#import <Foundation/Foundation.h>

@interface Car: NSObject
- (void)go;                             // go
- (void)go:(int)a;                      // go:
- (void)go:(int)a speed:(int)s;         // go:speed:
@end

@implementation Car
- (void)go                          { printf("go0\n"); }
- (void)go:(int)a;                  { printf("go1\n"); }
- (void)go:(int)a speed:(int)s;     { printf("go2\n"); }
@end

@interface Ship: NSObject
- (void)go;
@end
@implementation Ship
- (void)go { printf("ship go\n"); }
@end

// '다형성'을 구현하는 방법
//  1. 오버라이딩
//     '상속'
//  2. Duck Typing
//     연관된 타입이 아니더라도 다형성을 쉽게 구현할 수 있다.


// 1. 개념: 메소드의 고유 이름(ID)
//    셀렉터 = 함수 포인터
//    : 실행 시간에 어떤 함수를 호출할 지 결정하고 싶다.

int main()
{
    SEL s1 = @selector(go);
    SEL s2 = @selector(go:);
    SEL s3 = @selector(go:speed:);
    
    // 셀렉터를 통해서 메소드를 호출하는 것이 가능하다.
    // => 객체가 필요하다.
    Car* p = [Car new];
    [p performSelector:@selector(go:speed:)];
    [p performSelector:s3];

    // ARC vs performSelector
    // : SEL 변수에 담아서 호출할 경우, 컴파일 시간에 어떤 메소드가 호출될지를
    //   알 수 없다.
    //   적절한 참조 계수 관련 코드를 삽입하는 것이 불가능하다.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [p performSelector:s1];
    [p performSelector:s2];
    [p performSelector:s3];
#pragma clang diagnostic pop
    
}












