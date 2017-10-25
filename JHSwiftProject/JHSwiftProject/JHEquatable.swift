//
//  JHEquatable.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHEquatable: NSObject {

    override init() {
        super.init()
        newEquatable()
        lazyStudy()
    }
    
    func newEquatable() {
        let spClass1 = SampleClass(s: "Hello")
        let spClass2 = SampleClass(s: "Hello")
        
        //如果两个常量或者变量引用同一个类实例则返回 true
        //(lldb) po lhs
        //<SampleClass: 0x604000443c30>
        
        //(lldb) po rhs
        //<SampleClass: 0x604000443cc0>
        //=== 恒等运算符
        if spClass1 === spClass2 {// false
            print("引用相同的类实例 \(spClass1)")
        }
        
        if spClass1 !== spClass2 {// true
            print("引用不相同的类实例 \(spClass2)")
        }
        
        if spClass1 == spClass2 {
            print("引用相同的类实例 \(spClass1.myProperty)")
        }
        
        if spClass1 != spClass2 {
            print("引用不相同的类实例 \(spClass2.myProperty)")
        }
    }
    
    func lazyStudy() {
        let firstsample = sample()
        print(firstsample.no.name)
    }

}

class SampleClass: Equatable {
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
    static func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
        return lhs.myProperty == rhs.myProperty
    }
}

//lazy
class sample {
    //必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
    lazy var no = number() // `var` 关键字是必须的
}

class number {
    var name = "Swift 学习"
}



