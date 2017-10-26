//
//  JHExtensionStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/26.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit


extension Int {
    var add: Int {return self + 100 }
    var sub: Int { return self - 10 }
    var mul: Int { return self * 10 }
    var div: Int { return self / 5 }
}

extension Int {
    // Swift 内建类型Int添加了一个整型下标。该下标[n]返回十进制数字
    subscript(multtable: Int) -> Int {
        var no1 = 1
        var temp = multtable
        while temp > 0 {
            no1 *= 10
            temp -= 1
        }
        return (self / no1) % 10
    }
}

class JHExtensionStudy: NSObject {

    override init() {
        super.init()
        
        extensionStudy()
    }
    
    func extensionStudy() {
        
        let addition = 3.add
        print("加法运算后的值：\(addition)")
        
        let subtraction = 120.sub
        print("减法运算后的值：\(subtraction)")
        
        let multiplication = 39.mul
        print("乘法运算后的值：\(multiplication)")
        
        let division = 55.div
        print("除法运算后的值: \(division)")
        
        let mix = 30.add + 34.sub
        print("混合运算结果：\(mix)")
        
        
        print(12[0])
        print(7869[1])
        print(786543[2])
    }
    
    
    
}


