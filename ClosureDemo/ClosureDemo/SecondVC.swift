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

        self.title = "循环引用"
        
        // 方式一 声明当前控制器为所引用 (推荐)
        DispatchQueue.global().async {
            
            self.download({
                
                weak var weakSelf = self
                
                DispatchQueue.main.sync {
                    weakSelf?.view.backgroundColor = UIColor.gray
                }
                
            })
            
        }
        
        // 方式二 [ weak self ] in (推荐)
        DispatchQueue.global().async {
            
            self.download({ [weak self] in
                
                DispatchQueue.main.sync {
                    self?.view.backgroundColor = UIColor.gray
                }
                
            })
            
        }
        
        // 方式三 [ unowned self ] in (不推荐)
        DispatchQueue.global().async {
            
            self.download({ [unowned self] in
                
                DispatchQueue.main.sync {
                    self.view.backgroundColor = UIColor.gray
                }
                
            })
            
        }
  
    }
    
    /**
        模拟操作
     */
    func download(_ finished: @escaping ()->Void) {
        
        print("执行耗时操作")
        finished()
        
        // 控制器对闭包进行强引用
        self.callBack = finished
        
    }
    
    deinit {
        print("控制器销毁")
    }


}
