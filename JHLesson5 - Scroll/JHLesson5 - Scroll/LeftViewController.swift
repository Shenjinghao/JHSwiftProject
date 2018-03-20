//
//  LeftViewController.swift
//  JHLesson5 - Scroll
//
//  Created by 作业帮 on 2018/3/20.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan

        let backImage = UIImageView.init(frame: self.view.frame)
        backImage.image = UIImage.init(named: "left")
        self.view.addSubview(backImage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
