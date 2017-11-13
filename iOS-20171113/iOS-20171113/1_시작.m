//  1_시작.m

// ObjC의 핵심 클래스를 모아놓은 헤더 파일
#import <Foundation/Foundation.h>

// 1. 확장자
//   .m(message) : C + ObjC
//   메소드를 호출한다. -> 메세지를 보낸다.
//   .mm         : C++ + ObjC

// 2. 헤더파일
//    C: #include
//     1) 중복 포함을 해결해야 한다. => include guard
//     2) 컴파일 속도
//     3) 사용하지 않는 부분도 포함
// ObjC: #import(GCC 확장)
//     1) 중복 포함을 처리한다.
//     2) 컴파일 속도 => 미리 컴파일된 헤더
//     3) 사용하지 않는 부분은 자동적으로 제거

#import "start.h"
#import "start.h"

int main()
{
    printf("hello, world...\n");
}

// Build: Command + B
// Run:   Command + R
