//
//  ViewController.swift
//  JHLesson3 - video
//
//  Created by 作业帮 on 2018/3/16.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {

    var playVideoButton = UIButton()
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createViews()
    }
    
    func createViews() {
        playVideoButton = UIButton.init()
        playVideoButton.frame = CGRect.init(x: self.view.frame.size.width / 2 - 50, y: 600, width: 100, height: 100)
        playVideoButton.layer.cornerRadius = 50
        playVideoButton.backgroundColor = UIColor.magenta
        playVideoButton.setTitle("播放", for: UIControlState.normal)
        self.view.addSubview(playVideoButton)
        playVideoButton.addTarget(self, action: #selector(playVideoButtonDidTouch), for: UIControlEvents.touchUpInside)
        
        
    }
    
    @objc func playVideoButtonDidTouch() {
        
        //定义一个视频文件路径
        let filePath = Bundle.main.path(forResource: "video", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        //定义一个视频播放器，通过本地文件路径初始化
        playerView = AVPlayer(url: videoURL)
        //设置大小和位置（全屏）
        let playerLayer = AVPlayerLayer(player: playerView)
        playerLayer.frame = self.view.bounds
        //添加到界面上
        self.view.layer.addSublayer(playerLayer)

        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

