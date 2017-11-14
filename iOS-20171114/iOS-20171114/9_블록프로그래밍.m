//
//  9_블록프로그래밍.m
#import <Foundation/Foundation.h>

// 1. 블록 프로그래밍은 ObjC의 문법이 아닙니다.
//    Apple에서 확장한 C언어의 문법입니다.
void swap(int* a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

// 변하지 않는 전체 알고리즘에서 변해야 하는 정책은 분리되어야 한다.
//  => 함수에서 정책을 분리하는 방법
//      : 정책을 인자로 전달 받는다.
// void sort(int* x, int n, int (*cmp)(int, int)) // 함수 포인터
void sort(int* x, int n, int (^cmp)(int, int))
{
    for (int i = 0 ; i < n - 1; ++i)
    {
        for (int j = i + 1; j < n ; ++j)
        {
            // if (x[i] < x[j])
            if (cmp(x[i], x[j]) > 0)
            {
                swap(&x[i], &x[j]);
            }
        }
    }
}

int cmp1(int a, int b) {
    return a - b;
}

int cmp2(int a, int b) {
    return b - a;
}

// 함수 포인터를 통한 정책의 전달 2가지 단점
//  1. 모든 정책은 이름을 가지는 함수 이어야 한다.
//  2. 정책은 상태를 가질 수 없다.
//     추가적인 정보를 전달하는 것이 힘들다.
// => 블록 프로그래밍

// 소프트웨어
//  =>    람다: 코드 조각을 인자로 전달하는 방법
//      클로져: 외부의 변수를 암묵적으로 전달 받을 수 있다.

int main()
{
    int x[10] = { 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 };
    
    int n = 42;
    sort(x, 10, ^(int a, int b) {
        printf("n: %d\n", n);
        return a - b;
    });
    
    // sort(x, 10, cmp2);
    
    for (int i = 0 ; i < 10 ; ++i)
        printf("%d\n", x[i]);
}

















