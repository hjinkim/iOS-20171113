//  8_객체소유권.m
#import <Foundation/Foundation.h>

// 참조 계수 증가
//  : 소유권(ownership)
//  => p라는 포인터를 통해서 객체를 사용할 때, 절대로 객체가 파괴되지 않음을
//     보장해야 한다.
//  => 객체의 참조 계수도 감소해야 하는 책임.

// MRC 에서 setter의 코드를 작성할 때, 소유권에 따라 다른 코드가 작성되어야 합니다.

#if 0
@class Phone;  // 클래스 전방 선언
@interface Person : NSObject {
    Phone* _phone;
}

- (void)setPhone:(Phone*)phone;

@end

@implementation Person

// 1) 소유권이 있는 경우
- (void)setPhone:(Phone*)phone {
    if (phone != _phone) {
        [_phone release];        // 1. 기존 객체에 대한 참조 계수 감소
        _phone = [phone retain]; // 2. 새로운 객체에 대한 참조 계수 증가
    }
}

- (void)dealloc {
    [_phone release];
    
    [super dealloc];
}


#if 0
// 1) 소유권이 없는 경우
- (void)setPhone:(Phone*)phone {
    _phone = phone;
}
#endif

@end

@interface Phone : NSObject
@end

@implementation Phone
@end
#endif


// 1. 결국 사용자는 프로퍼티를 통해서 setter를 생성합니다.
//       MRC                            ARC
// retain: 소유권 있음  ---------->       strong
// assign: 소유권 없음                    assign
//                                     weak
//                                     unsafe_unretained
@class Phone;  // 클래스 전방 선언
@interface Person : NSObject
@property(retain) Phone* phone1;
@property(assign) Phone* phone2;
@end

@implementation Person
- (void)dealloc {
    [_phone1 release];
    
    [super dealloc];
}


@end

@interface Phone : NSObject
@end

@implementation Phone
@end

int main()
{
    
}













