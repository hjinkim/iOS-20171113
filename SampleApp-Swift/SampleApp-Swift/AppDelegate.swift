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
        view.backgroundColor = UIColor.blue
        window?.addSubview(view)
        
        
        
        
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





