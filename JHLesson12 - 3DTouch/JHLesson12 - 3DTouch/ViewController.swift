//
//  ViewController.swift
//  JHLesson12 - 3DTouch
//
//  Created by 作业帮 on 2018/6/1.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImageView()
        backImage.frame = self.view.bounds
        backImage.image = UIImage.init(named: "image2")
        self.view.addSubview(backImage)
        self.title = "根控制器"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

