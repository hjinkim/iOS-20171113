//  AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    
        window = UIWindow(frame: UIScreen.main.bounds)
    
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        // View를 생성하는 방법 2가지
        // 1. 직접 생성
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 320))
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let button = UIButton(type: .infoLight)
        button.frame.origin = CGPoint(x: 100, y: 350)
        window?.addSubview(button)
        
        let button2 = UIButton(type: .roundedRect)
        button2.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button2.setTitle("Hello", for: .normal)
        window?.addSubview(button2)
        
        // addSubView를 마지막에 호출한 View가 가장 위에 있습니다.
        //  => z order가 가장 높습니다.
        
        // 2. Xcode - Interface Builder
        
    
        return true
    }

    
    #if false
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("App 시작")
        
        // let frame = UIScreen.main.bounds
        window = UIWindow(frame: UIScreen.main.bounds)
        // window.backgroundColor = UIColor.yellow
        
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        #if false
        if window != nil {
            window!.backgroundColor = UIColor.yellow
        }
        #endif
        return true
    }
    #endif
}





