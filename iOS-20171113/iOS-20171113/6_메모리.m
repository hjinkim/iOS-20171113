//
//  6_메모리.m (MRC)
//  : 객체의 수명 관리
#import <Foundation/Foundation.h>


// 객체의 수명을 관리하는 기술 - 매우 중요합니다.
//  1. ObjC에서는 객체의 수명을 참조 계수 기반으로 관리하고 있습니다.
//  2. 참조 계수를 구현하는 방식 - 3가지
//    1) MRC: Menual Reference Counting
//       => 프로그래머가 직접 참조 계수를 관리한다.
//       C++, C

//    2) GC: 별도의 프로그램이 객체의 참조 계수를 관리해서, 메모리를 수거한다.
//        => Run time
//       Java, C#, Go
//       GC의 성능저하가 발생한다.
//       유연하다.

//    3) ARC: Auto Reference Counting
//       => 컴파일 타임에 컴파일러가 코드를 분석해서, 참조 계수 관련 코드를
//          삽입한다.
//       => Compile time
//       ObjC, Swift

//       빠르다. 성능의 저하가 거의 없다.
//       컴파일러가 판단하지 못하는 상황에 대해서 프로그래머가
//       추가적인 고려를 해야 한다.

@interface Car: NSObject

- (void)dealloc;

@end
@implementation Car

- (void)dealloc {
    // 1. 자신의 필드를 정리한 후
    printf("객체 파괴\n");
    
    // 2. MRC에서는 부모의 dealloc을 명시적으로 호출해야 합니다.
    [super dealloc];
}

@end

int main()
{
    Car* p1 = [Car new];
    // 1. 객체 생성시 참조 계수는 1 입니다.
    printf("ref count: %ld\n", [p1 retainCount]);
    
    // 2. 객체의 포인터 대입 후, 참조 계수는 증가해야 합니다.
    Car* p2 = p1;
    [p2 retain];      // 참조 계수 증가!
    printf("ref count: %ld\n", [p1 retainCount]);
    
    // 3. 더 이상 사용하지 않는 포인터에 대해서는 반드시 해당 객체의
    //    참조 계수를 감소해야 합니다.
    [p1 release];
    printf("ref count: %ld\n", [p1 retainCount]);
    
    [p2 release];
    
    printf("프로그램 종료...\n");
}















