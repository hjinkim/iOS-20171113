//  9_객체소유권_ARC.m
#import <Foundation/Foundation.h>

// 참조 계수 모델의 문제점
//  => 상호 참조가 발생할 경우, 메모리 누수가 발생합니다.

// 약한 참조
//  => 상호 참조의 문제를 해결할 수 있습니다.
//  => 참조 계수 모델에서 약한 참조는 반드시 해당 객체가 파괴되었는지 여부를
//     감지할 수 있어야 합니다.

// autoniling: 프로퍼티가 참조하는 객체가 파괴되면, 해당 포인터 변수를
//             nil로 변경해줍니다.

// 강한 참조(참조 계수 증감)     약한 참조(참조 계수 증감하지 않는다)
//    strong                weak(autoniling)
//                          unsafe_unretained(dangling pointer)

//                   assign(scala-type)

// ObjC의 타입
//   1. Scala-Type: int, double, float, struct
//   2. Reference-Type

// Swift 타입
//   value-type       : struct(Int, Double...)
//   reference-type   : class
//   enum-type        : enum

@class Phone;  // 클래스 전방 선언
@interface Person : NSObject
@property(strong) Phone* phone1;
@property(assign) Phone* phone2;
@end

@implementation Person
@end

@interface Phone : NSObject
@end

@implementation Phone
@end

int main()
{
    
}
