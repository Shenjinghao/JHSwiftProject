//
//  JHARCStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/25.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHARCStudy: NSObject {

    override init() {
        super.init()
        
        arcStudy()
    }
    
    func arcStudy() {
        
        // 值会被自动初始化为nil，目前还不会引用到Person类的实例
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        // 创建Person类的新实例
        reference1 = Person(name: "Runoob")
        
        
        //赋值给其他两个变量，该实例又会多出两个强引用
        reference2 = reference1
        reference3 = reference1
        
        //断开第一个强引用
        reference1 = nil
        //断开第二个强引用
        reference2 = nil
        //断开第三个强引用，并调用析构函数
        reference3 = nil
        
        //弱引用实例
        var toc: Module?
        var list: SubModule?
        toc = Module(name: "ARC")
        list = SubModule(number: 4)
        toc!.sub = list
        list!.topic = toc
        
        toc = nil
        list = nil
        
        //无主引用实例
        var module: Student?
        module = Student(name: "ARC")
        module!.section = Marks(marks: 98, stname: module!)
        module = nil
        
        
        
        //创建并打印HTMLElement实例
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        
        // HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息
        paragraph = nil
    }
    
    class Person {
        let name: String
        init(name: String) {
            self.name = name
            print("\(name) 开始初始化")
        }
        deinit {
            print("\(name) 被析构")
        }
    }
    
    class Module {
        let name: String
        init(name: String) { self.name = name }
        var sub: SubModule?
        deinit { print("\(name) 主模块") }
    }
    
    class SubModule {
        let number: Int
        
        init(number: Int) { self.number = number }
        
        //弱引用实例
        weak var topic: Module?
        
        deinit { print("submodule 弱引用实例 析构函数调用成功") }
    }
    
    class Student {
        let name: String
        var section: Marks?
        
        init(name: String) {
            self.name = name
        }
        
        deinit { print("\(name)") }
    }
    class Marks {
        let marks: Int
        
        //无主引用实例
        unowned let stname: Student
        
        init(marks: Int, stname: Student) {
            self.marks = marks
            self.stname = stname
        }
        
        deinit { print("Student 无主引用实例 析构函数调用成功") }
    }
    
    class HTMLElement {
        
        let name: String
        let text: String?
        
        lazy var asHTML: () -> String = {
            [unowned self] in
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }
        
        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }
        
        deinit {
            print("闭包引起的循环强引用 被析构")
        }
        
    }
    
}
