//
//  5_타겟액션.m
#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target-Action Pattern

@interface Button: NSObject {
    id  _target;
    SEL _action;
}

- (void)addTarget:(id)target action:(SEL)action;

- (void)click;
@end

@implementation Button
- (void)addTarget:(id)target action:(SEL)action {
    _target = target;
    _action = action;
}

// ObjC: nil 객체에 메소드를 호출하면, 프로그램이 죽지 않습니다.
//     => 무시됩니다.
- (void)click {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_target performSelector:_action];
#pragma clang diagnostic pop
}
@end

@interface Dialog: NSObject
- (void)close;
@end

@implementation Dialog
- (void)close     { printf("close...\n"); }
@end

int main()
{
    Dialog* dialog = [Dialog new];
    Button* button = [Button new];
    
    [button addTarget:dialog action:@selector(close)];
    
    // 버튼이 클릭되었을 때, dialog close가 호출되고 싶다.
    [button click];
}







