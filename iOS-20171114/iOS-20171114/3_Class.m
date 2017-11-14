//
//  3_Class.m
#import <Foundation/Foundation.h>

// Class: class 타입
//   Java/C#: Reflection
//   ObjC:    Introspection
//   C++:     RTTI(Runtime Type Information)

@interface Car: NSObject
@end
@implementation Car
@end

@interface Truck: Car
- (void)go;
@end
@implementation Truck
- (void)go { printf("go\n"); }
@end

void foo(id p)
{
    // p가 만약 Truck 타입이라면 go를 호출하고 싶다.
    if ([p class] == [Truck class])
        [p go];
}


int main()
{
    // 1. Class를 얻어 내는 방법
    //   1) 타입을 통해 얻는 방법
    Class c1 = [Car class];  // Car.class
    //   2) 객체를 통해 얻는 방법
    Car* p = [Car new];
    Class c2 = [p class];    // p.getClass()
    //   3) 문자열을 통해 얻는 방법
    Class c3 = NSClassFromString(@"Car");
    
    // 2. 용도
    //   1) 실행 시간에 특정 객체의 타입을 확인하고 싶다.
    p = [Truck new];
    foo(p);
    
    //   2) 동적 생성 - iOS Framework
    //   : 실행 시간에 어떤 객체를 생성할 지를 결정하고 싶다.
    id p2 = [c3 new];  // Class -> Car? Truck? ....
}












