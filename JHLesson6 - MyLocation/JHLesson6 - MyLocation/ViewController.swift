//
//  ViewController.swift
//  JHLesson6 - MyLocation
//
//  Created by 作业帮 on 2018/3/20.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var infoLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "bg")!)
        createViews()
    }

    func createViews() {
        let topLabel = UILabel.init(frame: CGRect.init(x: 0, y: 50, width: self.view.frame.width, height: 80))
        topLabel.text = "My Loacation \n 我的位置"
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.systemFont(ofSize: 20)
        topLabel.numberOfLines = 2
        topLabel.backgroundColor = UIColor.clear
        topLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(topLabel)
        
        infoLabel = UILabel.init(frame: CGRect.init(x: 0, y: 150, width: self.view.frame.width, height: 380))
        infoLabel.textColor = UIColor.white
        infoLabel.font = UIFont.systemFont(ofSize: 20)
        infoLabel.numberOfLines = 0
        infoLabel.backgroundColor = UIColor.clear
        infoLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(infoLabel)
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 80))
        btn.setBackgroundImage(UIImage.init(named: "find_my_location"), for: UIControlState.normal)
        btn.setTitle("查询我的位置", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(findMyLocation), for: UIControlEvents.touchUpInside)
        
        //实例化一个定位管理器
        let locationManager = CLLocationManager()
        //设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位进度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //最佳定位
        //更新距离
        locationManager.distanceFilter = 100
        //发出授权请求
        locationManager.requestAlwaysAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()){
            //允许使用定位服务的话，开始定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
            
        }
        
    }
    
    var str = String()
    
    @objc func findMyLocation() {
        infoLabel.text = str
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //获取最新的坐标
        let currLocation : CLLocation = locations.last!  // 持续更新
        
        str = "纬度:\(currLocation.coordinate.latitude) \n + 纬度:\(currLocation.coordinate.longitude)  海拔:\(currLocation.altitude)  水平精度:\(currLocation.horizontalAccuracy)  垂直精度:\(currLocation.verticalAccuracy)  方向:\(currLocation.course)  速度:\(currLocation.speed)"
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        str = error.localizedDescription
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

