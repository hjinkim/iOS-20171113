//  AppDelegate.swift
import UIKit

// MVC - Model / View / Controller
// Model: 데이터를 저장하고 처리하는 역활
// View: 사용자의 입력을 처리하는 역활
// Controller: 이벤트에 따른 모델의 변경이나 뷰의 변경을 처리하는 역활

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    
        window = UIWindow(frame: UIScreen.main.bounds)
    
        window?.backgroundColor = UIColor.yellow
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        
        #if false
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
        #endif
        
        // addSubView를 마지막에 호출한 View가 가장 위에 있습니다.
        //  => z order가 가장 높습니다.
        
        // 2. Xcode - Interface Builder
        //  1) MyView.xib를 프로젝트 추가
        //  2) MyView.xib가 빌드되면 MyView.nib라는 파일로 변환되서 저장됩니다.
        //  3) MyView.nib를 Bundle에서 찾아 UIView로 변환해서 사용해야 합니다.
        #if false
        let bundle = Bundle.main
        let nib  = bundle.loadNibNamed("MyView", owner: nil, options: nil)
        if let view = nib?[0] as? UIView {
            window?.addSubview(view)
        }
        #endif
        
        if let view = Bundle.main.loadNibNamed("MyView", owner: nil, options: nil)?[0] as? UIView {
            window?.addSubview(view)
        }
        
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





