//
//  JHConsstructStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHConsstructStudy: NSObject {
    
    override init() {
        super.init()
        
        testCode()
        
        deinitStudy()
    }
    func testCode() {
        
        let rectarea = Rectangle(180.0)
        print("面积为：\(rectarea.length)")
        
        let rearea = Rectangle(370.0)
        print("面积为：\(rearea.length)")
        
        let recarea = Rectangle(110.0)
        print("面积为：\(recarea.length)")
        
        // origin和size属性都使用定义时的默认值Point(x: 0.0, y: 0.0)和Size(width: 0.0, height: 0.0)：
        let basicRect = Rect()
        print("Size 结构体初始值1: \(basicRect.size.width, basicRect.size.height) ")
        print("Rect 结构体初始值1: \(basicRect.origin.x, basicRect.origin.y) ")
        
        // 将origin和size的参数值赋给对应的存储型属性
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                              size: Size(width: 5.0, height: 5.0))
        
        print("Size 结构体初始值2: \(originRect.size.width, originRect.size.height) ")
        print("Rect 结构体初始值2: \(originRect.origin.x, originRect.origin.y) ")
        
        
        //先通过center和size的值计算出origin的坐标。
        //然后再调用（或代理给）init(origin:size:)构造器来将新的origin和size值赋值到对应的属性中
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                              size: Size(width: 3.0, height: 3.0))
        
        print("Size 结构体初始值3: \(centerRect.size.width, centerRect.size.height) ")
        print("Rect 结构体初始值3: \(centerRect.origin.x, centerRect.origin.y) ")
        
        
        //通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
        // someCreature 的类型是 Animal? 而不是 Animal
        let someCreature = Animal(species: "长颈鹿")
        
        // 打印 "动物初始化为长颈鹿"
        if let giraffe = someCreature {
            print("动物初始化为\(giraffe.species)")
        }
        
        
        
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("这是一个已定义的温度单位，所以初始化成功。")
        }
        
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("这不是一个已定义的温度单位，所以初始化失败。")
        }
        
        
        let plName = Planet(name: "Mercury")
        print("行星的名字是: \(plName.name)")
        
        let noplName = Planet()
        print("没有这个名字的行星: \(noplName.name)")
    }

    func deinitStudy() {
        
        //析构函数
        class BaseClass {
            var counter = 0;  // 引用计数器
            init() {
                counter += 1;
            }
            deinit {
                counter -= 1;
            }
        }
        
        var show: BaseClass? = BaseClass()
        print(show!.counter)
        show = nil
        print(show?.counter)
    }
    
    struct Rectangle {
        //如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
        //当存储属性声明为可选时，将自动初始化为空 nil
        let length: Double?
        
        //只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
        //对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
        //尽管 length 属性现在是常量，我们仍然可以在其类的构造器中设置它的值：
        init(frombreadth breadth: Double) {
            length = breadth * 10
        }
        
        init(frombre bre: Double) {
            length = bre * 30
        }
        
        init(_ area: Double) {
            length = area
        }
    }
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Point {
        var x = 0.0, y = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }
    
    struct Animal {
        let species: String
        init?(species: String) {
            if species.isEmpty { return nil }
            self.species = species
        }
    }
    
    enum TemperatureUnit {
        // 开尔文，摄氏，华氏
        case Kelvin, Celsius, Fahrenheit
        init?(symbol: Character) {
            switch symbol {
            case "K":
                self = .Kelvin
            case "C":
                self = .Celsius
            case "F":
                self = .Fahrenheit
            default:
                return nil
            }
        }
    }
    
    class Planet {
        var name: String
        
        init(name: String) {
            self.name = name
        }
        
        convenience init() {
            self.init(name: "[No Planets]")
        }
    }
    
    class planets: Planet {
        var count: Int
        
        init(name: String, count: Int) {
            self.count = count
            super.init(name: name)
        }
        
        override convenience init(name: String) {
            self.init(name: name, count: 1)
        }
    }
    
    
}
