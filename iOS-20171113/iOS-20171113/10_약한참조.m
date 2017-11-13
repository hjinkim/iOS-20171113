//  10_약한참조.m
//  RxJava  / RxAndroid
//  RxSwift / RxCocoa

//  Reactive Extension
#import <Foundation/Foundation.h>
//      [default]
// MRC   assign
// ARC   strong

// 1. 상호 참조의 가능성이 있을 경우, 절대 강한 참조를 사용하면 안됩니다.
// 2. 댕글링 포인터의 문제가 있는 unsafe_unretained보다는 weak을 사용하는 것이
//    더 좋습니다.

//             Java/C#                          C++
// 강한 참조       .                            shared_ptr
// 약한 참조   WeakReference<>                  weak_ptr
//           : GC가 발생되면 무조건 수거됩니다.
//          SoftReference<>
//           : out of memory에 가까워지면 수거됩니다.

@interface Node: NSObject

//  readonly:  getter
//  readwrite: getter + setter - default

//  스레드 안정성에 관련된 속성
//   - atomic: 동기화             - default
//   - nonatomic: 동기화를 하지 않음
@property(strong, atomic) NSString* name;

@property(weak) Node* next;
// @property(unsafe_unretained) Node* next;

@end
@implementation Node
- (void)foo {
    _name = @"hello";      // 직접 접근
    self.name = @"hello";  // setter를 통한 접근
}



-(void)dealloc {
    // printf("dealloc..\n");
}
@end

void foo()
{
    for (int i = 0 ; i < 10000000; ++i)
    {
        Node* p1 = [Node new];
        Node* p2 = [Node new];
        
        p1.next = p2;
        p2.next = p1;
    }
}

// unsafe_unretained: 3.091091
// weak:              5.105147

int main()
{
    NSDate* startTime = [NSDate date];
    foo();
    printf("%lf\n", -[startTime timeIntervalSinceNow]);
    
    printf("프로그램 종료...\n");
}









