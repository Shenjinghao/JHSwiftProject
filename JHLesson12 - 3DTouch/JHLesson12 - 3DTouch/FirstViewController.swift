//
//  FirstViewController.swift
//  JHLesson12 - 3DTouch
//
//  Created by 作业帮 on 2018/6/1.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIViewControllerPreviewingDelegate {

    var backImageName : NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backImage = UIImageView()
        backImage.frame = self.view.bounds
        backImage.image = UIImage.init(named: backImageName as String)
        self.view.addSubview(backImage)
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer()
//        backImage.addGestureRecognizer(tap)
        registerForPreviewing(with: self, sourceView: self.view)
        
    }
    
    //当用力按压的时候要预览的VC
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        var iVC = ViewController()
        return iVC
    }
    //当用力按压持续用力的时候，所要进行的操作
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        var iVC = ViewController()
        self.navigationController?.pushViewController(iVC, animated: true)
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
