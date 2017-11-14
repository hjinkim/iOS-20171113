#import <UIKit/UIKit.h>

// AppDelegate 역활
// 1. App의 상태가 변경될 때마다 UIApplication 객체로부터의
//    메세지를 수신한다.
//   : UIApplicationDelegate
// 2. App이 성공적으로 시작한 경우,
//    UIWindow를 만들고 초기화한다.
// 3. 터치 이벤트 관련 기능이 추가되었습니다. - Responder Chain

// iOS 5.x 이전
// @interface AppDelegate : NSObject<UIApplicationDelegate>
@interface AppDelegate : UIResponder<UIApplicationDelegate>

@property(strong, nonatomic) UIWindow* window;

@end

















