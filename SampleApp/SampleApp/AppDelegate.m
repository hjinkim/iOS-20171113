
#import "AppDelegate.h"

// #define YES 1
// #define NO  0

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    printf("App 시작\n");
    
    // UIScreen를 통해 현재 폰의 해상도를 얻어 올 수 있다.
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    // CGRect frame = CGRectMake(0, 0, 320, 300);
    self.window = [[UIWindow alloc] initWithFrame:frame];
    
    _window.backgroundColor = UIColor.yellowColor;
    _window.rootViewController = [UIViewController new];
    
    [_window makeKeyAndVisible];
    return YES;
}

@end










