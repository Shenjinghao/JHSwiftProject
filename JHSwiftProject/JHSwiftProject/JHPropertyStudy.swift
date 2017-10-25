//
//  JHPropertyStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHPropertyStudy: NSObject {

    override init() {
        super.init()
        
        calculatePro()
        mutateMethod()
    }
    
    func calculatePro() {
        let result = sample()
        print(result.middle)
        
        result.middle = (0.0, 10.0)
        print(result.no1)
        print(result.no2)
        
        
        let NewCounter = Samplepgm()
        NewCounter.counter = 100
        NewCounter.counter = 800
        
        
        var stud1Mark1 = StudMarks()
        var stud1Mark2 = StudMarks()
        
        stud1Mark1.InternalMarks = 98
        print(stud1Mark1.InternalMarks)
        
        stud1Mark2.InternalMarks = 87
        print(stud1Mark2.InternalMarks)
        
        
        let pri = calculations(a: 600, b: 300)
        let sum = calculations(a: 1200, b: 300)
        
        pri.result()
        sum.result()
    }
    
    func mutateMethod() {
        var val = area(length: 3, breadth: 5)
        val.scaleBy(res: 3)
        val.scaleBy(res: 30)
        val.scaleBy(res: 300)
    }
    
    
    class sample {
        //必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let关键字只用来声明常量属性，表示初始化后再也无法修改的值。
        var no1 = 0.0, no2 = 0.0
        var length = 300.0, breadth = 150.0
        
        var middle: (Double, Double) {
            get{
                return (length / 2, breadth / 2)
            }
            set(axis){
                no1 = axis.0 - (length / 2)
                no2 = axis.1 - (breadth / 2)
            }
        }
    }
    
    class Samplepgm {
        var counter: Int = 0{
            //willSet在设置新的值之前调用
            //didSet在新的值被设置之后立即调用
            //willSet和didSet观察器在属性初始化过程中不会被调用
            willSet(newTotal){
                print("计数器: \(newTotal)")
            }
            didSet{
                if counter > oldValue {
                    print("新增数 \(counter - oldValue)")
                }
            }
        }
    }
    
    struct StudMarks {
        static let markCount = 97
        static var totalCount = 0
        var InternalMarks: Int = 0 {
            didSet {
                if InternalMarks > StudMarks.markCount {
                    InternalMarks = StudMarks.markCount
                }
                if InternalMarks > StudMarks.totalCount {
                    StudMarks.totalCount = InternalMarks
                }
            }
        }
    }
    
    class calculations {
        let a: Int
        let b: Int
        let res: Int
        
        init(a: Int, b: Int) {
            self.a = a
            self.b = b
            res = a + b
            print("Self 内: \(res)")
        }
        
        func tot(c: Int) -> Int {
            return res - c
        }
        
        func result() {
            print("结果为: \(tot(c: 20))")
            print("结果为: \(tot(c: 50))")
        }
    }
    
    struct area {
        var length = 1
        var breadth = 1
        
        func area() -> Int {
            return length * breadth
        }
        
        //选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。
        mutating func scaleBy(res: Int) {
            length *= res
            breadth *= res
            
            print(length)
            print(breadth)
        }
    }
    
}

