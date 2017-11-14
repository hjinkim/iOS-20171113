//
//  6_리터럴문법.m
#import <Foundation/Foundation.h>

int main()
{
    // 1. 문자열
    // NSString* s = [[NSString alloc] initWithString:@"aaa"];
    NSString* s = @"aaa";
    
    // 2. 리터럴 숫자
    // 42  -> int
    // id[]
    NSArray* arr1 = [NSArray
                     arrayWithObjects:
                     [NSNumber numberWithInt:42],
                     [NSNumber numberWithInt:10],
                     [NSNumber numberWithInt:20],
                     nil];
    
    arr1 = [NSArray
            arrayWithObjects:
            @42, @10, @20,
            nil];
    
    // 3. 리터럴 배열
    arr1 = @[ @42, @10, @20 ];
    NSLog(@"%@", [arr1 objectAtIndex:0]);
    NSLog(@"%@", arr1[0]);
    
    // 4. 리터럴 사전
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"Tom", @"Name",   // value, key
                         @42, @"Age",
                         nil];
    
    dic = @{
            @"Name": @"Tom",
            @"Age": @42
            };
    
    NSLog(@"%@ -> %@", @"name", [dic objectForKey:@"Name"]);
    NSLog(@"%@ -> %@", @"name", dic[@"Name"]);
}


