//
//  JHEnumStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHEnumStudy: NSObject {

    override init() {
        super.init()
        
        announceScore(score: 100)
        announceScore(score: 90)
        announceScore(score: 60)
        announceScore(score: 10)
    }
    enum Score3: RawRepresentable{
        case Fail(Int)
        case Pass(Int)
        case Good(Int)
        case Perfect(Int)
        
        typealias RawValue = Int
        
        var rawValue: RawValue {
            var grade : Int
            switch self {
            case .Fail(let g):
                grade = g
            case .Pass(let g):
                grade = g
            case .Good(let g):
                grade = g
            case .Perfect(let g):
                grade = g
            }
            return grade
        }
        init?(rawValue: RawValue) {
            if(rawValue < 60){
                self = .Fail(rawValue)
            }else if(rawValue < 80){
                self = .Pass(rawValue)
            }else if(rawValue < 90){
                self = .Good(rawValue)
            }else{
                self = .Perfect(rawValue)
            }
        }
    }
    
    //如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线_来显示描述它的外部名
    func writeComment(_ score : Score3) -> () {
        var comment : String
        switch score {
        case .Fail:
            comment = "表现不好，要努力啊!"
        case .Pass:
            comment = "加油！"
        case .Good:
            comment = "不错！"
        case .Perfect:
            comment = "非常好！"
        }
        print("comment:\(comment), score:\(score.rawValue)")
    }
    
    func applauseStudent(score : Score3) -> () {
        switch score {
        case .Perfect:
            print("你是我的骄傲, 你考了\(score.rawValue)")
        default: break
        }
    }
    
    func announceScore(score : Int) -> () {
        let score3 = Score3(rawValue: score)
        writeComment(score3!)
        applauseStudent(score: score3!)
    }
    
}
