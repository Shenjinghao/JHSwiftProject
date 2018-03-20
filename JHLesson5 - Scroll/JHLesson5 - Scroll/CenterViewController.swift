//
//  CenterViewController.swift
//  JHLesson5 - Scroll
//
//  Created by 作业帮 on 2018/3/20.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
//    var captureSession = AVCaptureSession()
//    var stillImageOutput = AVCaptureStillImageOutput()
//    var previewLayer = AVCaptureVideoPreviewLayer()
//    
//    var tempImageView = UIImageView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.magenta
        let backImage = UIImageView.init(frame: self.view.frame)
        backImage.image = UIImage.init(named: "center")
        self.view.addSubview(backImage)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        captureSession = AVCaptureSession()
//        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
//
//        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
//        var error : NSError?
//        var input: AVCaptureDeviceInput!
//
//        do {
//            input = try AVCaptureDeviceInput(device: backCamera!) }
//        catch let error1 as NSError {
//            error = error1
//            input = nil
//        }
//
//        if (error == nil && captureSession.canAddInput(input) != nil) {
//            captureSession.addInput(input)
//            stillImageOutput = AVCaptureStillImageOutput()
//            stillImageOutput.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
//
//            if (captureSession.canAddOutput(stillImageOutput) != nil) {
//                captureSession.addOutput(stillImageOutput)
//                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//                previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
//                previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
//                self.view.layer.addSublayer(previewLayer)
//                captureSession.startRunning()
//            }
//        }
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        previewLayer.frame = self.view.bounds
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        didPressTakeAnother()
//    }
//
//    var didTakePhoto = Bool()
//
//    func didPressTakeAnother(){
//        if didTakePhoto == true{
//            tempImageView.isHidden = true
//            didTakePhoto = false
//
//        }
//        else{
//            captureSession.startRunning()
//            didTakePhoto = true
//            didPressTakePhoto()
//
//        }
//
//    }
//
//    func didPressTakePhoto(){
//        if let videoConnection = stillImageOutput.connection(with: AVMediaType.video){
//            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
//            stillImageOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
//                (sampleBuffer, error) in
//                if sampleBuffer != nil {
//                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
//                    let dataProvider  = CGDataProvider(data: imageData as! CFData)
//                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
//
//                    let image = UIImage.init(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
//
//                    self.tempImageView.image = image
//                    self.tempImageView.isHidden = false
//
//                }
//            })
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
