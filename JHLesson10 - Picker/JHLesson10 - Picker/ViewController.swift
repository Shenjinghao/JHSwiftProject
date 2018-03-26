//
//  ViewController.swift
//  JHLesson10 - Picker
//
//  Created by 作业帮 on 2018/3/23.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pickerView = UIPickerView()
    var btn = UIButton()
    var imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queueStudy()
        
        let image = UIImageView.init(frame: view.frame)
        image.image = UIImage.init(named: "bg")
        view.addSubview(image)
        
        pickerView.frame = CGRect.init(x: 0, y: 100, width: view.frame.width, height: 200)
//        pickerView.backgroundColor = UIColor.cyan
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        
        btn = UIButton.init(frame: CGRect.init(x: 30, y: 500, width: view.frame.width - 60, height: 60))
        btn.backgroundColor = UIColor.magenta
        btn.setTitle("Start", for: .normal)
        btn.layer.cornerRadius = 10
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.bounds = btn.bounds
        
        for _ in 0...100 {
            self.dataArray1.append((Int)(arc4random() % 10 ))
            self.dataArray2.append((Int)(arc4random() % 10 ))
            self.dataArray3.append((Int)(arc4random() % 10 ))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btn.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .transitionFlipFromLeft, animations: {
            
            self.btn.alpha = 1
            
        }, completion: nil)
        
    }
    
    @objc func btnAction() {
        
        var ASemaphore = DispatchSemaphore(value: 1)
        var BSemaphore = DispatchSemaphore(value: 0)
        var CSemaphore = DispatchSemaphore(value: 0)
        
        let serial = DispatchQueue(label: "serialQueue1")
        
        serial.async {
            print("A")
            self.pickerView.selectRow(Int(arc4random()) % 10, inComponent: 0, animated: true)
        }
        
        serial.async {
            print("B")
            self.pickerView.selectRow(Int(arc4random()) % 10, inComponent: 1, animated: true)
        }
        
        serial.async {
            print("C")
            self.pickerView.selectRow(Int(arc4random()) % 10, inComponent: 2, animated: true)
//            ASemaphore.wait()
//            BSemaphore.signal()
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.btn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
            
        }, completion: { (compelete: Bool) in
            
            self.btn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
            
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 50)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
    
    
    func queueStudy() {
        //创建串行队列
        let serial = DispatchQueue(label: "serialQueue1")
        //创建并行队列
        let concurrent = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        //获取系统存在的全局队列
        let globalQueue = DispatchQueue.global(qos: .default)
        //main
        let mainQueue = DispatchQueue.main
        
        DispatchQueue.global(qos: .default).async {
            //处理耗时操作的代码块...
            print("do work")
            
            //操作完成，调用主线程来刷新界面
            DispatchQueue.main.async {
                print("main refresh")
            }
        }
        
        //添加同步代码块到global队列
        //不会造成死锁，但会一直等待代码块执行完毕
        DispatchQueue.global(qos: .default).sync {
            print("sync1")
        }
        print("end1")
        
        
        //添加同步代码块到main队列
        //会引起死锁
        //因为在主线程里面添加一个任务，因为是同步，所以要等添加的任务执行完毕后才能继续走下去。但是新添加的任务排在
        //队列的末尾，要执行完成必须等前面的任务执行完成，由此又回到了第一步，程序卡死
//        DispatchQueue.main.sync {
//            print("sync2")
//        }
//        print("end2")
        
        //创建并行队列
        let conQueue = DispatchQueue(label: "concurrentQueue1", attributes: .concurrent)
        //暂停一个队列
        conQueue.suspend()
        //继续队列
        conQueue.resume()
        
        //获取系统存在的全局队列
        let queue = DispatchQueue.global(qos: .default)
        //定义一个group
        let group = DispatchGroup()
        //并发任务，顺序执行
        queue.async(group: group) {
            sleep(2)
            print("block1")
        }
        queue.async(group: group) {
            print("block2")
        }
        queue.async(group: group) {
            print("block3")
        }
        
        //1,所有任务执行结束汇总，不阻塞当前线程
        group.notify(queue: .global(), execute: {
            print("group done")
        })
    }
}

