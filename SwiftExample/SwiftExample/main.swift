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

#endif

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





















