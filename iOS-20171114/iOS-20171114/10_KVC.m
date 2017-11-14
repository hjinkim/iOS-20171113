//  10_KVC.m
#import <Foundation/Foundation.h>

// object['name'] = 'Bob';
// object['age'] = 42;

// 특정 프로퍼티의 값을 문자열을 통해서 읽거나 변경할 수 있다.
@interface Person: NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;

@end

@implementation Person
@end

// JSON
// {
//    "name": "Tom",
//    "age":  42
// }

// User
//   self.name = json["name"]
//   self.age = json["age"]

//   [self setValue:value forKey:key];


// KVC - ObjC
int main()
{
    Person* person = [Person new];
    person.name = @"Tom";
    person.age = 42;
    
    // KVC
    [person setValue:@"Bob" forKey:@"name"];
    NSLog(@"%@", [person valueForKey:@"name"]);
}













