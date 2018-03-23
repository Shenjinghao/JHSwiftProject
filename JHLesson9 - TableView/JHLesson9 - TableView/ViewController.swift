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
    var tableData = [String]()
    var oldTableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    var newTableData = ["Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test","Refresh Test",]
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "动效", style: .plain, target: self, action: #selector(animateTable))
        self.navigationItem.rightBarButtonItem = item;
        
        title = "TableView"
        
        createTableView()
        createRefresh()
    }
    
    func createTableView() {
        tableData = oldTableData
        tableView = UITableView.init(frame: view.frame)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func createRefresh() {
        self.refreshControl.backgroundColor = UIColor.white
        tableView.refreshControl = refreshControl
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        self.refreshControl.attributedTitle = NSAttributedString(string: "更新于 \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.black
        refreshControl.addTarget(self, action: #selector(refreshAction), for: UIControlEvents.valueChanged)
        
    }
    
    @objc func animateTable() {
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
        }
    }
    
    @objc func refreshAction() {
        self.tableData = self.newTableData
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (time) in
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.backgroundColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.detailTextLabel?.text = tableData[indexPath.row]
        return cell
    }
    
}

