//
//  ViewController.swift
//  JHLesson5 - Scroll
//
//  Created by 作业帮 on 2018/3/20.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = UIScrollView.init(frame: self.view.bounds)
        self.view.addSubview(self.scrollView)
        
        let leftVC = LeftViewController()
        leftVC.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let centerVC = CenterViewController()
        centerVC.view.frame = CGRect.init(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let rightVC = RightViewController()
        rightVC.view.frame = CGRect.init(x: 2 * self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMove(toParentViewController: self)
        
        self.addChildViewController(centerVC)
        self.scrollView.addSubview(centerVC.view)
        centerVC.didMove(toParentViewController: self)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMove(toParentViewController: self)
        
        self.scrollView.contentSize = CGSize.init(width: self.view.frame.width * 3, height: self.view.frame.size.height)
        //是否一页一页的滚动
        self.scrollView.isPagingEnabled =
        true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

