//  8_프로토콜.m
#import <Foundation/Foundation.h>

// ObjC에서 이벤트를 처리하는 방법 3가지
// 1. Target-Action: Selector
// 2. Delegate: Protocol
//   : 다른 객체의 변화에 대응을 하거나 행동에 변화를 줄 수 있는 패턴
// 3. 블록 프로그래밍

// 프로토콜: '인터페이스'의 개념
@protocol CLLocationManagerDelegate
@required
- (void)updateLocation;

@optional
- (void)failToLocation;
@end

@interface CLLocationManager: NSObject

// delegate는 반드시 weak으로 지정해야 합니다.
//  => 순환 참조의 문제가 발생하기 때문입니다.
@property(weak, nonatomic) id<CLLocationManagerDelegate> delegate;
// CLLocationManagerDelegate delegate  // Swift

- (void)startUpdateLocation;

@end
@implementation CLLocationManager

- (void)startUpdateLocation {
    // GPS의 정보가 변경될 때마다 등록된 객체에게 변경된 사실을
    // 알려야 한다.
    [_delegate updateLocation];
    
    // 실패한 경우, 실패에 대한 정보를 등록된 객체에게 알려주어야 한다.
    // [_delegate failToLocation];
}

@end

@interface User: NSObject
@end
@implementation User
@end

// @interface ClassName: ParentClass<Protocol1, Protocol2...>
@interface Car: NSObject<CLLocationManagerDelegate>
@property(strong, nonatomic) CLLocationManager* manager;
@end
@implementation Car
- (void)updateLocation {
    printf("update location\n");
}

//- (void)failToLocation {
//    printf("fail to location\n");
//}

@end

int main()
{
    Car* car = [Car new];
    CLLocationManager* manager = [CLLocationManager new];
    
    manager.delegate = car;
    // manager.delegate = [User new];
    
    [manager startUpdateLocation];
}










