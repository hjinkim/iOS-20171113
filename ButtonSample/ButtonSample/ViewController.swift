import UIKit

class ViewController: UIViewController {
    
    // Xcode 9
    @objc func foo() {
        print("foo")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .infoDark)
        button.frame
            = CGRect(x: 10, y: 10, width: 100, height: 50)
        
        // ObjC id  -> Any
        //      SEL -> Selector
        //      @selector -> #selector(foo)
        button.addTarget(self, action: #selector(foo), for: .touchUpInside)
        
        
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

