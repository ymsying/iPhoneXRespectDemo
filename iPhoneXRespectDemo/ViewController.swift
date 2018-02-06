//
//  ViewController.swift
//  iPhoneXRespectDemo
//
//  Created by 应明顺 on 2018/2/6.
//  Copyright © 2018年 应明顺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var myView: UIView!
    var myView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
            0. 通过keyWindow获取SafeArea
         
            1. 在iOS11中有SafeArea的概念，
                1.1. 在iPhoneX中SafeArea是距离边框的距离，分横屏、竖屏
                1.2. 除了iPhoneX其他设备没有刘海问题
         
            2. 顶部使用nav+sts的高度
                2.1. 在 iOS < 11 中只管nav+sts
                2.2. 在 iOS >= 11 中只管iPhoneX的safeArea
         
            3. SafeArea 大小，取safeAreaInsets
                3.1 在iPhoneX中分竖屏横屏
                    竖屏：portrait --> insets{44, 0, 34, 0}
                    横屏：landscape --> insets{0, 44, 21, 44}
                3.2 非iPhoneX的均为 insets{0, 0, 0, 0}
         
            4. navHeight、tabHeight和stsHeight不同
                4.1 在iPhoneX中分竖屏横屏
                     竖屏：portrait --> {
                             navHeight = 44
                             tabHeight = 83 = 49 + 34
                             stsHeight = 44
                     }
                     横屏：landscape --> {
                             navHeight = 32
                             tabHeight = 53
                             stsHeight = 0
                     }
                4.2 非iPhoneX的为
                     竖屏：portrait --> {
                            navHeight = 44
                            tabHeight = 49
                            stsHeight = 20
                     }
                     横屏：landscape --> {
                            navHeight {
                                !plus = 32
                                 plus = 44
                            }
                            tabHeight {
                                 ios 11 && !plus = 32
                                 其他 = 49
                            }
                            stsHeight = 0
                     }
         
            5. iOS 11时 iPhoneX 的安全边距已经将statueBar涵盖，其他没有情况没涵盖
         
         */
        
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
        var staBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        
        let str = "navBarHeight:\(String(describing: navBarHeight))  \ntabBarHeight:\(String(describing: tabBarHeight))  \nstaBarHeight:\(staBarHeight)"
        
        print(str)
        
        if #available(iOS 11.0, *) {
            print("additionalSafeAreaInsets" + NSStringFromUIEdgeInsets(self.additionalSafeAreaInsets))
        }
        
        
        
        self.view.backgroundColor = UIColor.red
        var insets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            insets = (UIApplication.shared.delegate?.window??.safeAreaInsets)!;
            print("insets" + NSStringFromUIEdgeInsets(insets))
            
            if !UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsets.zero) {
                staBarHeight = 0
            }
        }
        
        print(insets)
        myView = UIView(frame: CGRect.init(x: insets.left, y: insets.top + navBarHeight! + staBarHeight, width: 100, height: 100))
        myView.backgroundColor = UIColor.yellow
        self.view.addSubview(myView)
        
        
        
        myView1 = UIView(frame: CGRect.init(x: insets.left, y: self.view.bounds.height - insets.bottom - 100 - tabBarHeight!, width: 100, height: 100))
        myView1.backgroundColor = UIColor.green
        self.view.addSubview(myView1)
        
        
        
        
        let label = UILabel.init()
        label.frame = CGRect(x: insets.left, y: myView.frame.origin.y + myView.frame.size.height, width: self.view.frame.size.width, height: 200)
        label.numberOfLines = 0
        label.text = str
        self.view.addSubview(label)
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            print("viewSafeAreaInsetsDidChange" + NSStringFromUIEdgeInsets(self.view.safeAreaInsets))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

