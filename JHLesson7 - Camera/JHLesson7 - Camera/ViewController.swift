//
//  ViewController.swift
//  JHLesson7 - Camera
//
//  Created by 作业帮 on 2018/3/20.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var image = UIImage()
    var imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
    }
    
    func createViews() {
        
        let space = NSInteger((self.view.frame.size.width - 200) / 3)
        
        let startCameraButton = UIButton.init()
        startCameraButton.frame = CGRect.init(x: space, y: 500, width: 100, height: 100)
        startCameraButton.layer.cornerRadius = 50
        startCameraButton.backgroundColor = UIColor.magenta
        startCameraButton.setTitle("打开相机", for: UIControlState.normal)
        self.view.addSubview(startCameraButton)
        startCameraButton.addTarget(self, action: #selector(startCameraButtonDidTouch), for: UIControlEvents.touchUpInside)
        
        let startPhotoButton = UIButton.init()
        startPhotoButton.frame = CGRect.init(x: space * 2 + 100, y: 500, width: 100, height: 100)
        startPhotoButton.layer.cornerRadius = 50
        startPhotoButton.backgroundColor = UIColor.cyan
        startPhotoButton.setTitle("打开相册", for: UIControlState.normal)
        self.view.addSubview(startPhotoButton)
        startPhotoButton.addTarget(self, action: #selector(startPhotoButtonDidTouch), for: UIControlEvents.touchUpInside)
        
        imageView = UIImageView.init(frame: CGRect.init(x: 60, y: 80, width: self.view.frame.size.width - 120, height: 400))
        view.addSubview(imageView)
        
    }
    
    @objc func startCameraButtonDidTouch() {
        camera()
        
    }
    
    @objc func startPhotoButtonDidTouch() {
        photo()
        
    }
    
    //调用照片方法
    
    func photo() {
        let pick:UIImagePickerController = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(pick, animated: true, completion: nil)
        
    }
    
    //调用照相机方法
    func camera() {
        let pick:UIImagePickerController = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = UIImagePickerControllerSourceType.camera
        self.present(pick, animated: true, completion: nil)
    }
    
    //MARK:- UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [String :Any]) {
        
        let type:String = (info[UIImagePickerControllerMediaType]as!String)
        
        //当选择的类型是图片
        
        if type=="public.image" {
            
            image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
            
            imageView.image = image
            picker.dismiss(animated:true, completion:nil)
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
        
        picker.dismiss(animated:true, completion:nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

