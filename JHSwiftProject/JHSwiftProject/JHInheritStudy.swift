//
//  JHInheritStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHInheritStudy: NSObject {
    
    override init() {
        super.init()
        
        let superClass = SuperClass()
        superClass.show()
        
        let subClass = SubClass()
        subClass.show()
        
        
        //重写属性
        let rect = Rectangle()
        rect.radius = 25.0
        rect.print = 3
        print("Radius \(rect.area)")
        
        
        //重写属性观察器
        let sq = Square()
        sq.radius = 100.0
        print("半径: \(sq.area)")
        
        /*
        我们可以使用 final 关键字防止它们被重写。
        如果你重写了final方法，属性或下标脚本，在编译时会报错。
        你可以通过在关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误
         */

    }

    class SuperClass {
        func show() {
            print("这是超类 SuperClass")
        }
    }
    
    class SubClass: SuperClass  {
        override func show() {
            print("这是子类 SubClass")
        }
    }
    
    class Circle {
        var radius = 12.5
        var area: String {
            return "矩形半径 \(radius) "
        }
    }
    
    // 继承超类 Circle
    class Rectangle: Circle {
        var print = 7
        override var area: String {
            return super.area + " ，但现在被重写为 \(print)"
        }
    }
    
    class Square: Rectangle {
        override var radius: Double {
            didSet {
                print = Int(radius/5.0)+1
            }
        }
    }
    
    
}
