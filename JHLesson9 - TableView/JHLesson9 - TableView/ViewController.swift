//
//  ViewController.swift
//  JHLesson9 - TableView
//
//  Created by 作业帮 on 2018/3/21.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: view.frame)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
}

