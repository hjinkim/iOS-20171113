//  1_프로퍼티활용.m
#import <Foundation/Foundation.h>

// 객체 내부에서 인스턴스 변수에 접근하는 방법 2가지
// 1) _firstName      - 직접 접근
// 2) self.firstName  - 접근자 메소드

// 1. 객체 내부에서 인스턴스 변수를 읽을 때는 [직접 접근]을 하고
//    [변경]할 때는 접근자 메소드를 사용하는 것이 좋다.
//   예외) 1) 초기화 메소드 안에서는 setter를 이용해서 값을 변경하는 것이 아니라
//        직접 접근을 통해서 값을 변경해야 합니다.
//     => 자식이 부모의 필드의 setter를 재정의하였을 경우
//        부모의 필드가 온전히 초기화 될 수 없는 문제가 발생할 수 있다.
//        2) 초기화 메소드 안에서 부모의 필드를 초기화하고자 한다면
//           그 때는 setter를 이용하면 됩니다.

// 값을 변경: setter
// 초기화 메소드에서 변경: 직접 접근
// 값을 읽는다: 직접 접근
// 지연 초기화: getter

@interface Phone: NSObject
@end
@implementation Phone
@end

@class Phone;
@interface Person : NSObject
@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;

@property(strong, nonatomic) Phone* phone;

- (instancetype)initWithFirstName:(NSString*)firstName
               lastName:(NSString*)lastName;

// - initXXX
- (instancetype)initWithFullName:(NSString*)fullName;
- (Phone*)phone;

// p1.fullName = @"aaa bbb"
- (void)setFullName:(NSString*)fullName;
- (NSString*)fullName;

@end

@implementation Person

- (void)foo {
    NSLog(@"%@", _phone);
    NSLog(@"%@", self.phone);
}

- (Phone*)phone {
    if (_phone == nil) {
        _phone = [Phone new];
    }
    
    return _phone;
}

// 값을 변경할 때는 setter가 좋다.
- (void)setFullName:(NSString *)fullName {
    NSArray* arr = [fullName
                    componentsSeparatedByString:@" "];
    self.firstName = [arr objectAtIndex:0];
    self.lastName = [arr objectAtIndex:1];
}

// 값을 읽을 때는 직접 접근이 좋다.
//  예외) 특정 프로퍼티가 '지연 초기화'의 방법을 사용하고 있다면
//       반드시 getter를 이용해야 합니다.
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@, %@",
            _firstName, _lastName];
}

// "Chansik Yun"
- (instancetype)initWithFullName:(NSString*)fullName {
    self = [super init];
    if (self) {
        NSArray* arr = [fullName
                        componentsSeparatedByString:@" "];
        _firstName = [arr objectAtIndex:0];
        _lastName = [arr objectAtIndex:1];
    }
    
    return self;
}

- (instancetype)initWithFirstName:(NSString*)firstName
                         lastName:(NSString*)lastName {
    self = [super init];
    if (self) {
        // self.firstName = firstName;  // setFirstName
        // self.lastName = lastName;    // setLastName
        _firstName = firstName;
        _lastName = lastName;
    }
    
    return self;
}

@end


int main()
{
    Person* p1 = [[Person alloc]
                 initWithFirstName:@"Chansik" lastName:@"Yun"];
    [p1 foo];
    NSLog(@"%@, %@", p1.firstName, p1.lastName);

    p1.fullName = @"Chansik Kim"; // [p1 setFullName]
    NSLog(@"%@", p1.fullName);    // [p1 fullName]

    Person* p2 = [[Person alloc] initWithFullName:@"Chansik Yun"];
    NSLog(@"%@, %@", p2.firstName, p2.lastName);
}










