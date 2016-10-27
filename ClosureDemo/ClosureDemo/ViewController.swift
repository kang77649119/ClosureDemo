//
//  ViewController.swift
//  ClosureDemo
//
//  Created by 也许、 on 16/8/19.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
        闭包实例1
     */
    func closureDemo1(_ sayHello:()->()) {
        print("closureDemo1------去上班............")
        sayHello()
    }
    
    @IBAction func demo1(_ sender: UIButton) {
        
        // 如果只有函数只有1个参数，并且为闭包，可以省略函数名后的()
        closureDemo1() {
            print("刷帅哥的卡~~~~~~~~")
        }
        
        closureDemo1 { 
            print("帅美女的卡~~~~~~~~")
        }
        
    }
    
    /**
        闭包实例2
     */
    func closureDemo2(_ name:String,sayHello: (_ name:String) ->()) {
        sayHello(name)
    }
    
    @IBAction func closureDemo2(_ sender: UIButton) {
        
        print("closureDemo2-----去上班")
        closureDemo2("张三") { (name) in
            print("帮\(name)刷卡~~~~~~~~~~")
        }
        
    }
    
    /**
        闭包实例3
     */
    func closureDemo3( _ method1:()->Int, method2:(_ count:Int)->Void) {
        
        method2(method1())
        
    }
    
    @IBAction func closureDemo3(_ sender: UIButton) {
        
        print("一天上班打几次卡？")
        
        closureDemo3({ () -> Int in
            return 2
        }) { (count) in
            print("别的公司是\(count)次,我们打4次,wtf")
        }
        
    }
    
}

