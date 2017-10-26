//
//  JHProtocolStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/26.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit


protocol daysofaweek {
    mutating func show()
}


protocol tcpprotocol {
    init(no1: Int)
}


protocol Generator {
    associatedtype members
    func next() -> members?
}


protocol HasArea {
    //只读
    var area: Double { get }
}

class JHProtocolStudy: NSObject {

    override init() {
        super.init()
        
        protocolStudy()
    }
    
    func protocolStudy() {
        
        var res = days.wed
        res.show()
        
        
        
        let temp = mainClass(no1: 1)
        let show = subClass(no1: 2, no2: 3)
        let tem = subClass(no1: 4)
        
        print("res is: \(temp.no1)")
        print("res is: \(show.no1)")
        print("res is: \(show.no2)")
        print("res is: \(tem.no1)")
        print("res is: \(tem.no2)")
        
        
        var items = [10,20,30].makeIterator()
        while let x = items.next() {
            print(x)
        }
        
        for lists in [1,2,3].map( {i in i*5}) {
            print(lists)
        }
        
        print([100,200,300])
        print([1,2,3].map({i in i*10}))
        
        
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        
        for object in objects {
            // 对迭代出的每一个元素进行检查，看它是否遵循了HasArea协议
            if let objectWithArea = object as? HasArea {
                print("面积为 \(objectWithArea.area)")
            } else {
                print("没有面积")
            }
        }

    }
    
    
    enum days: daysofaweek {
        case sun, mon, tue, wed, thurs, fri, sat
        
        //将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值
        mutating func show() {
            switch self {
            case .sun:
                self = .sun
                print("Sunday")
            case .mon:
                self = .mon
                print("Monday")
            case .tue:
                self = .tue
                print("Tuesday")
            case .wed:
                self = .wed
                print("Wednesday")
            case .thurs:
                self = .thurs
                print("Wednesday")
            case .fri:
                self = .fri
                print("Wednesday")
            case .sat:
                self = .sat
                print("Saturday")
            default:
                print("NO Such Day")
            }
        }
        
    }
    
    class mainClass {
        var no1: Int // 局部变量
        init(no1: Int) {
            self.no1 = no1 // 初始化
        }
    }
    
    class subClass: mainClass, tcpprotocol {
        var no2: Int
        init(no1: Int, no2 : Int) {
            self.no2 = no2
            super.init(no1:no1)
        }
        // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
        required override convenience init(no1: Int)  {
            self.init(no1:no1, no2:0)
        }
    }
    
    // 定义了Circle类，都遵循了HasArea协议
    class Circle: HasArea {
        let pi = 3.1415927
        var radius: Double
        var area: Double { return pi * radius * radius }
        init(radius: Double) { self.radius = radius }
    }
    
    // 定义了Country类，都遵循了HasArea协议
    class Country: HasArea {
        var area: Double
        init(area: Double) { self.area = area }
    }
    
    // Animal是一个没有实现HasArea协议的类
    class Animal {
        var legs: Int
        init(legs: Int) { self.legs = legs }
    }
    
    
}
