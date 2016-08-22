//
//  SecondVC.swift
//  ClosureDemo
//
//  Created by 也许、 on 16/8/22.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    // 闭包属性
    var callBack:(()->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "第二个界面"
        
        // 声明当前控制器为所引用
        weak var weakSelf = self
        
        // 执行耗时操作，在闭包中完成其他功能
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            self.download {
            
                dispatch_async(dispatch_get_main_queue(), {
                    print("回到主线程")
                    weakSelf!.view.backgroundColor = UIColor.grayColor()
                })
                
            }
        }
  
    }
    
    /**
        模拟操作
     */
    func download(finished:()->Void) {
        
        print("执行耗时操作")
        finished()
        
        // 控制器对闭包进行强引用
        self.callBack = finished
        
    }
    
    deinit {
        print("控制器销毁")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
