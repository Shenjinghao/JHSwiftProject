//
//  ViewController.swift
//  JHLesson1
//
//  Created by 作业帮 on 2017/10/27.
//  Copyright © 2017年 SJH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeLabel: UILabel!
    var playButton: UIButton!
    var pauseButton: UIButton!
    
    var counter = 0.0
    var myTimer = Timer()
    var isPlaying = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
    }
    
    func createViews() {
        timeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 300))
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.systemFont(ofSize: 40)
        timeLabel.textColor = UIColor.white
        timeLabel.backgroundColor = UIColor.black
        timeLabel.text = String(counter)
        self.view.addSubview(timeLabel)
        
        let rect1: CGRect = CGRect.init(x: 0, y: 300, width: self.view.bounds.size.width / 2, height: self.view.bounds.size.height - 300)
        playButton = UIButton.init(frame: rect1)
        playButton.backgroundColor = UIColor.magenta
        playButton.titleLabel?.textColor = UIColor.white
//        playButton.setTitle("开始", for: UIControlState.normal)
        playButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        playButton.setImage(UIImage(named:"play"),for:UIControlState.normal)
        self.view.addSubview(playButton)
        playButton.addTarget(self, action: #selector(playButtonAction), for: UIControlEvents.touchUpInside)
        
        let rect2: CGRect = CGRect.init(x: self.view.bounds.size.width / 2, y: 300, width: self.view.bounds.size.width / 2, height: self.view.bounds.size.height - 300)
        pauseButton = UIButton.init(frame: rect2)
        pauseButton.backgroundColor = UIColor.purple
        pauseButton.titleLabel?.textColor = UIColor.white
        pauseButton.titleLabel?.textAlignment = NSTextAlignment.center;
//        pauseButton.setTitle("暂停", for: UIControlState.normal)
        pauseButton.setImage(UIImage(named:"pause"),for:UIControlState.normal)
        pauseButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.view.addSubview(pauseButton)
        pauseButton.addTarget(self, action: #selector(pauseButtonAction), for: UIControlEvents.touchUpInside)

        
    }
    
    @objc func pauseButtonAction() {
        myTimer.invalidate()
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        isPlaying = false
    }
    
    @objc func playButtonAction() {
        if isPlaying {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerStart), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @objc func timerStart() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

