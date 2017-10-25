//
//  JHIndexStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/24.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHIndexStudy: NSObject {

    override init() {
        super.init()
        
        indexStudy()
    }
    func indexStudy() {
        
        let division = subexample(decrementer: 100)
        
        print("100 除以 9 等于 \(division[9])")
        print("100 除以 2 等于 \(division[2])")
        print("100 除以 3 等于 \(division[3])")
        print("100 除以 5 等于 \(division[5])")
        print("100 除以 7 等于 \(division[7])")
        
        
        var p = daysofaweek()
        
        print(p[0])
        print(p[1])
        print(p[2])
        print(p[3])
        
        var matrix = Matrix(rows: 2, columns: 2)
        print(matrix)
        // 通过下标脚本设置值
        matrix[0,0] = 1.0
        matrix[0,1] = 2.0
        matrix[1,0] = 3.0
        matrix[1,1] = 5.0
        
        // 通过下标脚本获取值
        print("\(matrix[0,0])")
        print("\(matrix[0,1])")
        print("\(matrix[1,0])")
        print("\(matrix[1,1])")

    }
    
    struct subexample {
        let decrementer: Int
        subscript(index: Int) -> Int {
            return decrementer / index
        }
    }
    
    class daysofaweek {
        private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                            "Thursday", "Friday", "saturday"]
        subscript(index: Int) -> String {
            get {
                return days[index]   // 声明下标脚本的值
            }
            set(newValue) {
                self.days[index] = newValue   // 执行赋值操作
            }
        }
    }
    
    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }
    
}
