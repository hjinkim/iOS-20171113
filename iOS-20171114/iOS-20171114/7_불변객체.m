//  7_불변객체.m
#import <Foundation/Foundation.h>

// 불변 객체(Immutable Object)
//  개념: 객체가 생성된 된 이후에 내부의 상태(값)이 변경되지 않는 객체

// 장점
//  1. 스레드에 안전하게 공유할 수 있다.
//  2. 상태가 변경되지 않기 때문에, 예상치 못한 객체의 상태 변경으로부터 자유롭다.
//  3. 상태가 동일한 객체는 공유하는 것이 가능하다.

// 단점
//  : 불변 객체를 만드는 것이 어렵다.

// ObjC의 Collection은 기본적으로 불변 객체 입니다.
//  => 별도의 가변 객체 버전을 제공하고 있습니다.
//  NSArray -> NSMutableArray
int main()
{
    // NSArray* arr = @[ @10, @20, @30 ];
    NSMutableArray* arr2 = [[NSMutableArray alloc] initWithObjects:@10, @20, @30, nil];
    
    arr2 = [@[ @10, @20, @30 ] mutableCopy];
    arr2[0] = @42;
    // arr[0] = @42;
    
    NSMutableDictionary* dic = [@{@"name": @"Tom" } mutableCopy];
    dic[@"name"] = @"Bob";
    
    NSString* s1 = @"AAA";
    NSMutableString* s2 = [@"AAA" mutableCopy];
    
    NSRange range = NSMakeRange(1, 2);
    [s2 replaceCharactersInRange:range withString:@"BB"];
    
    NSLog(@"%@", s2);
    
}













