//
//  11_KVO.m

#import <Foundation/Foundation.h>

// Key-Value Observing
//  : 특정 프로퍼티의 값이 실행 시간에 변경되는 것을 통보 받을 수 있다.

// 주의 사항
//  'KVO'를 통해 값의 변경을 통보 받기 위해서는
//  값에 대한 변경이 setter를 통해 이루어졌을 때에만 가능합니다.

@interface Person: NSObject
@property(strong, nonatomic) NSString* name;
@end

@implementation Person
@end

@interface UILabel: NSObject
@end

// UILabel은 Person 객체의 name의 값이 변경될 때마다
// 자신의 view를 업데이트 해야 한다.
@implementation UILabel

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void *)context {
    printf("User의 name이 변경되었음...\n");
    NSLog(@"%@", change);
    
    NSLog(@"new value: %@", change[NSKeyValueChangeNewKey]);
    // update view
}

@end

int main()
{
    Person* person = [Person new];
    UILabel* label = [UILabel new];
    
    [person addObserver:label
             forKeyPath:@"name"
                options:NSKeyValueObservingOptionNew
                context:nil];
    
    person.name = @"Bob";
    printf("...\n");
    
    // iOS 10 이전까지는 위의 코드로는 제대로 동작하지 않았습니다.
    // 프로그램이 종료되기 전에 반드시 등록된 모든 KVO를 제거해 주는 것이
    // 필요했습니다.
    [person removeObserver:label forKeyPath:@"name"];
    
    person.name = @"Tom";
    printf("...\n");
}

// Cocoa Framework       - macOS
// Cocoa Touch Framework - iOS












