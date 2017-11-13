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
    
    func go() {
        print("go")
    }
    
    static func ho() {
        print("ho")
    }
}

var p = Car()
p.speed = 42
print(p.speed)

p.go()
Car.ho()







