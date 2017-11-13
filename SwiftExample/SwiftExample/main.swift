//  main.swift
import Foundation

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





#if false
// var p = Car()
var p = Car(color: 100, speed: 42)

// p.speed = 42
print(p.speed)

p.go()
Car.ho()
#endif






