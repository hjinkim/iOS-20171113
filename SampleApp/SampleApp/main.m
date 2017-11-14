
// #import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 1. iOS App의 시작도 main 입니다.
//    UIKit - Cocoa Touch Framework

// 2. UIApplication 객체 생성
//    - UIApplicationMain
//    1) Info.plist를 기반으로 UIApplication 객체 생성
//    2) 생성된 UIApplication의 변화를 통보 받기 위한, 사용자 정의 클래스를
//       생성해줍니다.
//    3) 생성된 사용자 정의 AppDelegate 객체를 UIApplication의 delegate
//       로 연결해줍니다.
//        -> UIApplicationDelegate
//    4) 사용자의 이벤트를 처리하기 위한 이벤트 루프가 시작됩니다.

#import "AppDelegate.h"

int main(int argc, char* argv[])
{
    @autoreleasepool {

        // iOS 8.x 이후
        return UIApplicationMain(argc, argv, nil,
                NSStringFromClass([AppDelegate class]));
        
        // [AppDelegate class] -> "AppDelegate"
        
        // iOS 8.x 이전
        // return UIApplicationMain(argc, argv, nil, @"AppDelegate");
    }
}








