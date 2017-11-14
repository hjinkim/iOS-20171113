//
//  2_객체생성방법.m
#import <Foundation/Foundation.h>

// 1) alloc + init      <--- release
// 2) 편의 생성자          <--- autorelease

// ARC 원리: 컴파일러가 컴파일 시간에 코드를 분석해서 적절한 참조 계수 조작 관련
//          코드를 삽입한다.

// MRC vs ARC
// [p1 retain] / [p1 release]
// ARC는 참조 계수를 조작하는 모든 코드를 그대로 삽입하기 때문에
// ObjC의 함수를 호출하는 MRC 보다 빠르게 동작합니다.
int main()
{
    @autoreleasepool {
        NSArray* arr1 = [[NSArray alloc]
                         initWithObjects:@"A", "@B", @"C", nil];
    
        NSArray* arr2 = [NSArray
                         arrayWithObjects:@"A", @"B", @"C", nil];
        
        @autoreleasepool {
            // foo()
        }
        
    }
}











