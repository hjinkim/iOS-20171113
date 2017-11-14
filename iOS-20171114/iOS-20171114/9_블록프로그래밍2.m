//
//  9_블록프로그래밍2.m
#import <Foundation/Foundation.h>

// int a[3];         => int[3]

// void(int, int)    => function type
// void(*)(int, int) => function pointer type
// void(^)(int, int) => block type

// code(10, 42);

@interface Car: NSObject
- (void)foo:(int)a code:(void(^)(int a, int b))code;
@end

@implementation Car

- (void)foo:(int)a code:(void(^)(int a, int b))code {
    printf("a: %d\n", a);
    code(10, 42);
}

@end

int main()
{
    Car* p = [Car new];
    
    [p foo:100 code:^(int a, int b) {
        printf("a: %d, b: %d\n", a, b);
    }];
}














