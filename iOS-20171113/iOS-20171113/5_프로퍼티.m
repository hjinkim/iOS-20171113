//
//  5_프로퍼티.m
#import <Foundation/Foundation.h>

// 1. 객체의 인스턴스 변수의 값을 읽거나 변경하기 위해서는
//    접근자 메소드(getter + setter)를 통해 접근해야 합니다.

// 3. 프로퍼티: 인스턴스 변수 + 접근자 메소드를 자동으로 생성하는 문법
@interface Car: NSObject

@property int color;

- (void)foo;

@end
@implementation Car

- (void)foo {
    printf("color: %d\n", self.color);   // getter
    printf("color: %d\n", _color);       // memory 직접 접근
}

@end




#if 0
@interface Car: NSObject {
    int _color;
}

- (int)color;
- (void)setColor:(int)color;

@end

@implementation Car

- (int)color {
    return _color;
}

- (void)setColor:(int)color {
    _color = color;
}

@end
#endif

int main()
{
    Car* p = [Car new];
    
    [p setColor:42];
    printf("%d\n", [p color]);
    
    // 2. ObjC의 접근자 메소드의 이름 규칙을 지킨 경우
    //    . 연산자를 이용해서 setter와 getter를 이용할 수 있습니다.
    p.color = 100;              // [p setColor:100]
    printf("%d\n", p.color);    // printf("%d\n", [p color]);
}





