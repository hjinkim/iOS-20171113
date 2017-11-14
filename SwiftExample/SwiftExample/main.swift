//  main.swift
import Foundation

#if false

// 모든 클래스가 더 이상 NSObject의 자식인 것이 필수가 아닙니다.
class Car {
    var color: Int = 0
    var speed: Int = 0
    
    init() {
        color = 42
        speed = 100;
    }
    
    init(color: Int, speed: Int) {
        self.color = color
        self.speed = speed
    }
    
    func go() {
        print("go")
    }
    
    // swift에서는 printf를 사용하지 않습니다.
    //  => 문자열 보간을 사용한다면 printf보다 편리하게 사용할 수 있습니다.
    //   : ES6 - template string
    func go(speed: Int) {
        print("go1: \(speed)")
    }
    
    func go(speed: Int, color: Int) {
        print("go2: \(speed) \(color)")
    }
    
    func go(speed: Int, color: Int, dest: String) {
        print("go3: \(speed) \(color) \(dest)")
    }
    
    static func ho() {
        print("ho")
    }
}

var p = Car()
p.go()          // go0
p.go(speed: 42)
p.go(speed: 42, color: 100)
p.go(speed: 42, color: 100, dest: "Hello")





// var p = Car()
var p = Car(color: 100, speed: 42)

// p.speed = 42
print(p.speed)

p.go()
Car.ho()


// ?: Optional Type
//   => null일 수 있다.
//   C#: Nullable
//   Java: Optional
//   Haskell: Maybe

//      Swift    Scala     Javascript ES6
// 변수:  var      var           let
// 상수:  let      val           const

// Swift에서 weak의 프로퍼티는 반드시 Optional 타입이어야 합니다.
class Person {
    weak var phone: Phone?
    let name: String = "hello"
    // let 프로퍼티는 setter가 제공되지 않습니다.
    
    fileprivate func foo() {
        
    }
}

class Phone {
    func goo() {
        let p = Person()
        p.foo()
    }
}


class Phone {
    
}

class Person {
    lazy var phone: Phone? = Phone()
    
    var firstName: String
    var lastName: String
    
    var fullName: String {
        set {
            let arr = newValue.components(separatedBy: " ")
            firstName = arr[0]
            lastName = arr[1]
        }
        
        get {
            return "\(firstName), \(lastName)"
        }
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(fullName: String) {
        var arr = fullName.components(separatedBy: " ")
        self.firstName = arr[0]
        self.lastName = arr[1]
    }
    
    
    
}

#endif


// var가 아닌 let으로 전달됩니다.
func xswap(_ a:inout Int, _ b:inout Int)
{
    let temp = a
    a = b
    b = temp
}

//  for (int i = 0 ; i < n - 1; ++i)
//    for (int j = i + 1; j < n ; ++j)

// 함수 포인터 / 블록
//   => 클로저 타입
// int cmp(int, int)
// ((Int, Int) -> Int)

func sort(_ x:inout [Int], compare: ((Int, Int) -> Int))
{
    let n = x.count
    
    for i in 0..<n-1 {
        for j in i+1..<n {
            if compare(x[i], x[j]) > 0 {
                x.swapAt(i, j)
            }
        }
    }
    
}

// NSArray : Immutable
// NSMutableArray: Mutable
var x = [ 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 ]

sort(&x, compare: { (a: Int, b: Int) in
    return b - a
})
// 1. 파라미터 타입에 대한 부분을 컴파일러가 추론이 가능합니다.
// 2. 만약 한줄의 코드라면, return을 생략하는 것이 가능합니다.
sort(&x, compare: { (a, b) in
    b - a
})
// 3. 만약 함수의 인자 중 마지막 인자가 클로저 타입이라면
//    파라미터 라벨을 생략하는 것이 가능합니다.
sort(&x) { (a, b) in
    a - b
}
// 4. 인자의 이름이 의미가 없다면, 별도의 키워드를 통해 인자에 접근할 수 있습니다.
sort(&x) { $1 - $0 }








print(x)


#if false
var a: Int = 10
var b: Int = 20

xswap(&a, &b)
print("\(a) \(b)")
#endif

















