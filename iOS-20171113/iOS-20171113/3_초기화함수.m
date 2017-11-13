//
//  3_초기화함수.m
#import <Foundation/Foundation.h>


// 지정 초기화 메소드: 클래스의 설계자가 지정한 클래스가 온전하게 초기화되기 위해
//                사용해야 하는 초기화 메소드
//  => ObjC는 다른 언어와 다르게 초기화 메소드를 부모로부터 상속받습니다.

// 1. 초기화 함수 => 생성자
// 2. 이름 규칙
//   인스턴스 변수: _color
//   getter   : (int)color
//   setter   : (void)setColor:(int)color
@interface Car: NSObject {
    int _color;
}

// ObjC의 최상위 부모 타입은 2개 입니다.
//  : NSObject, NSProxy
//  => id

// id: 모든 객체를 가르키는 포인터 타입
//  java: Car() {}
// - (id)init;
// - (instancetype)init;

// 메소드의 이름이 init으로 시작하면 초기화 메소드 입니다.
- (instancetype)initWithColor:(int)color;

- (int)color;

@end

@implementation Car

- (instancetype)initWithColor:(int)color {
    printf("initWithColor\n");
    self = [super init];
    if (self) {
        _color = color;
    }
    
    return self;
}



#if 0
// 중요합니다!!
//  초기화 메소드를 만드는 방법
- (instancetype)init {
    printf("init\n");
    //  1) 부모의 '지정' 초기화 메소드를 호출해서, self(this)에 대입합니다.
    self = [super init];
    
    //  2) 부모의 초기화 메소드가 실패하지 않았다면,
    //     자신의 필드를 초기화한다.
    if (self) {
        _color = 42;
    }
    
    // 3) self를 반환한다.
    return self;
}
#endif

- (int)color {
    return _color;
}

@end

int main()
{
    Car* p = [Car new];
    // Car* p = [[Car alloc] init];
    //  1. 힙에 객체 메모리를 할당한다.   alloc
    //  2. 기본 초기화 메소드를 호출한다.  init
    
    // Car* p = [[Car alloc] initWithColor:42];
    // 사용자 정의 초기화 메소드를 사용하기 위해서는
    // new를 통해서 객체를 생성하는 것이 아니라, alloc + 사용자 정의 초기화 메소드의
    // 조합으로 직접 생성해야 합니다.
    // => 2단계 생성 패턴
    
    printf("color: %d\n", [p color]);
}







