//
//  ViewController.swift
//  JHLesson2 - font
//
//  Created by 作业帮 on 2018/3/16.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var data = ["hello world",
                "swift",
                "1234567890",
                "swift已经升级到4了，但是一刻也不能停止学习啊！",
                "@@@@@@"]
    
//    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    var fontNames = ["AppleSDGothicNeo-SemiBold", "PingFangTC-Medium", "AcademyEngravedLetPlain", "HelveticaNeue-CondensedBlack", "AvenirNextCondensed-UltraLight"]

    
    var fontRowIndex = 0
    
    var fontTableView = UITableView()
    var changeFontButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        self.createViews()
    }
    
    func createViews() {
        changeFontButton = UIButton.init()
        changeFontButton.frame = CGRect.init(x: self.view.frame.size.width / 2 - 50, y: 600, width: 100, height: 100)
        changeFontButton.layer.cornerRadius = 50
        changeFontButton.backgroundColor = UIColor.cyan
        changeFontButton.setTitle("改变字体", for: UIControlState.normal)
        self.view.addSubview(changeFontButton)
        changeFontButton.addTarget(self, action: #selector(changeFontButtonAction), for: UIControlEvents.touchUpInside)
        
        fontTableView = UITableView.init(frame: CGRect.init(x: 0, y: 40, width: self.view.frame.size.width, height: 450))
        fontTableView.delegate = self
        fontTableView.dataSource = self
        fontTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "fontCell")
        self.view.addSubview(fontTableView)
    }

    @objc func changeFontButtonAction() {
        fontRowIndex = (fontRowIndex + 1) % 5
        fontTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

