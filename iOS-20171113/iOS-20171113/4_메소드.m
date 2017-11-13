//
//  4_메소드.m
#import <Foundation/Foundation.h>

// 1. 2개 이상의 인자를 전달받는 메소드를 만드는 방법
@interface Car: NSObject

// go
- (void)go;

// go:
- (void)go:(int)speed;

// go:color:
- (void)go:(int)speed color:(int)color;

// go:color:destination:
- (void)go:(int)speed
     color:(int)color destination:(NSString*)destination;

// Command + `
// void go(int speed, int color, NSString* name, NSString* dest)

// go:color:name:dest:
- (void)go:(int)speed
     color:(int)color
      name:(NSString*)name
      dest:(NSString*)dest;

@end

@implementation Car

- (void)go:(int)speed
     color:(int)color
      name:(NSString*)name
      dest:(NSString*)dest {
    printf("go4\n");
}

- (void)go:(int)speed
     color:(int)color destination:(NSString*)destination {
    NSLog(@"speed(%d) color(%d) dest(%@)",
          speed, color, destination);
}

- (void)go { printf("go0\n"); }
- (void)go:(int)speed { printf("go1: %d\n", speed); }

- (void)go:(int)speed
     color:(int)color {
    printf("go2: %d %d\n", speed, color);
}

@end

int main()
{
    Car* p = [Car new];  // alloc + init
    
    [p go:42
    color:100
     name:@"Tom"
     dest:@"Seoul"];
    
    [p go];
    [p go:42];
    [p go:42 color:100];
    [p go:100 color:42];

    // go(42, 100, "seoul")
    
    [p go:42
    color:100
destination:@"seoul"];
    
}









