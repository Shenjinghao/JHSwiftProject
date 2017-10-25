//
//  JHBaseStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/20.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHBaseStudy: NSObject {
    
    override init() {
        super.init()
        //基础数据结构学习
        self.baseStudy()
        //函数学习
        print(funcNameUrlTest(name: "sjh", url: "hello"))
        
        //找到最大最小值
        let bounds = findMinAndMax(array: [8, -6, 2, 109, 3, 71])
        print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
        
        
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        
        //一般默认的参数传递都是传值调用的，而不是传引用。所以传入的参数在函数内改变，并不影响原来的那个参数。传入的只是这个参数的副本。
        //当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
        var x = 1
        var y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        //闭包
        closureStudy()
        
        //enum 枚举
        enumStudy()
        
        //结构体struct
        structStudy()
        
        //类
        classStudy()
        
    }
    
    func baseStudy() {
        var str = "Hello, playground"
        print(str)
        
        //在同一行，要用分号隔开
        var myString = "Hello, World!";print(myString)
        
        /*下面的会报错，空格位置不对
         let a = 1+ 2
         let a= 1 + 2
         */
        let a = 1 + 2;  // 编码规范推荐使用这种写法
        let b = 3+4 // 这样也是OK的
        
        //如果我们想让其不换行输出,只需要将最后一个参数赋值为空字符串即可:
        for x in 0...10{
            print("\(x) ", terminator: "")
            
        }
        
        let theInput = readLine()
        
        // Int 的类型别名为 Feet：
        typealias Feet = Int
        var distance: Feet = 100
        print("\n",distance)
        
        /*Swift 是一个类型安全（type safe）的语言。
         由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误
         var varA = 42
         varA = "This is hello"
         print(varA)
         */
        
        let meaningOfLife = 42
        // meaningOfLife 会被推测为 Int 类型
        //meaningOfLife = "hello"
        
        let pi = 3.14159
        // pi 会被推测为 Double 类型
        
        let anotherPi = 3 + 0.14159
        // anotherPi 会被推测为 Double 类型
        
        //可选类型
        
        var optionalInteger1: Int?
        var optionalInteger2: Optional<Int>
        
        var myOPtionalString:String? = nil
        
        if myOPtionalString != nil {
            print(myOPtionalString!)
        }else{
            print("myOPtionalString字符串为 nil")
        }
        
        
        //使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。
        var myForceString : String? = "Hello, Swift!"
        
        if myForceString != nil {
            // 强制解析
            print( myForceString! )
        }else{
            print("myForceString 值为 nil")
        }
        
        //在字符串中可以使用括号与反斜线来插入常量
        let name = "学习"
        let site = "swift"
        
        print("\(name) ：\(site)")
        
        //注意：swift3 中已经取消了++、--
        
        //let te = 1 ++
        
        print("闭区间运算符:")
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        print("半开区间运算符:")
        for index in 1..<5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        
        //循环‘
        
        //for循环方式在 Swift 3 中已经弃用。
        
        var someInts:[Int] = [10, 20, 30]
        
        for index in someInts {
            print( "index 的值为 \(index)")
        }
        var index = 15
        
        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
        
        
        let indexTh = 10
        
        switch indexTh {
        case 100  :
            print( "index 的值为 100")
            fallthrough
        case 10,15  :
            print( "index 的值为 10 或 15")
            fallthrough
        case 5  :
            print( "fallthrough index 的值为 5")
        default :
            print( "默认 case")
        }
        
        
        let stringA = ""
        
        if stringA.isEmpty {
            print( "stringA 是空的" )
        } else {
            print( "stringA 不是空的" )
        }
        
        // 实例化 String 类来创建空字符串
        let stringB = String()
        
        if stringB.isEmpty {
            print( "stringB 是空的" )
        } else {
            print( "stringB 不是空的" )
        }
        
        
        let constA = "哈哈"
        let constB = "呵呵"
        
        let constAll = constA + constB
        print(constAll)
        
        //转换字符串数字为整型。 实例:
        let myChangeString: String = "256"
        let myInt: Int? = Int(myChangeString)
        print(myInt!)
        
        let varA   = "Hello, Swift!"
        let varB   = "Hello, World!"
        
        if varA == varB {
            print( "\(varA) 与 \(varB) 是相等的" )
        } else {
            print( "\(varA) 与 \(varB) 是不相等的" )
        }
        
        
        print( "\(varA), 长度为 \(varA.characters.count)" )
        
        
        //字符
        // Swift 中以下赋值会报错
        //如果你想在 Character（字符） 类型的常量中存储更多的字符，则程序执行会报错
        //let char: Character = "AB"
        
        // Swift 中以下赋值会报错
        //Swift 中不能创建空的 Character（字符） 类型变量或常量：
        //let char1: Character = ""
        
        
        for ch in "hello".characters {
            print(ch)
        }
        
        var varC:String = "Hello "
        let varD:Character = "G"
        
        varC.append( varD )
        
        print("varC  =  \(varC)")
        
        //以下实例创建了一个类型为 Int ，数量为 3，初始值为 0 的空数组
        var someIntsArray = [Int](repeating: 0, count: 3)
        var someInts3Array:[Int] = [10, 20, 30]
        
        print( "第一个元素的值 \(someIntsArray[0])  \(someInts3Array[0])" )
        print( "第二个元素的值 \(someIntsArray[1])   \(someInts3Array[1])" )
        print( "第三个元素的值 \(someIntsArray[2])   \(someInts3Array[2])" )
        
        var someAppend = [Int]()
        
        someAppend.append(20)
        someAppend.append(30)
        someAppend += [40]
        
        print( "第一个元素的值 \(someAppend[0])" )
        print( "第二个元素的值 \(someAppend[1])" )
        print( "第三个元素的值 \(someAppend[2])" )
        
        
        
        //合并数组
        let intssA = [Int](repeating: 2, count:2)
        let intssB = [Int](repeating: 1, count:3)
        
        let intssC = intssA + intssB
        
        for item in intssC {
            print( "合并数组", item)
        }
        
        //字典
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        
        let oldVal = someDict.updateValue("One 新的值", forKey: 1)
        
        someDict[2] = "two的新值";
        
        let removedValue = someDict.removeValue(forKey: 3)
        
        print( "dict 的值为 \(someDict)" )
        print( "key = 1 旧的值 \(oldVal)" )
        print( "key = 2 的值为 \(someDict[2])" )
        print( "key = 3 的值为 \(someDict[3])" )
        
        //遍历字典
        for (key, value) in someDict {
            print("字典 key \(key) -  字典 value \(value)")
        }
        
        for (key, value) in someDict.enumerated() {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
        }
        
    }
    
    func funcNameUrlTest(name: String,url: String) -> String {
        return name + url
    }
    
    //minMax(_:)的函数，作用是在一个Int数组中找出最小值与最大值。
    func findMinAndMax(array: [Int]) -> (min: Int, max: Int) {
        if array.isEmpty {
            return (0, 0)//优化
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {//优化
            if value < currentMin {
                currentMin = value
            }else if value > currentMax {
                currentMax = value
            }
        }
        //可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
        return (currentMin, currentMax)
    }

    //可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的
    func vari<params>(members: params...){
        for i in members {
            print(i)
        }
    }
    
    //如果想要声明一个变量参数，可以在参数定义前加 inout 关键字，这样就可以改变这个参数的值了
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //closure闭包学习
    func closureStudy() {
        
        //闭包实例
        let studname = { print("Swift 闭包实例。") }
        studname()
        
        let names = ["T", "E", "D", "S", "B"]
        // 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        let reversed = names.sorted(by: backwards)
        print(reversed)
        
        //$0和$1表示闭包中第一个和第二个String类型的参数
        let reversed1 = names.sorted( by: { $0 > $1 } )
        print(reversed1)
        
        let reversed2 = names.sorted(by: >)
        print(reversed2)
        
        //尾随闭包
        let reversed3 = names.sorted() { $0 > $1 }
        print(reversed3)
        
        let reversed4 = names.sorted { $0 > $1 }
        
        //捕获外部变量
        func makeIncrementor(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementor() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        
        let incrementByTen = makeIncrementor(forIncrement: 10)
        
        // 返回的值为10
        print(incrementByTen())
        
        // 返回的值为20
        print(incrementByTen())
        
        // 返回的值为30
        print(incrementByTen())
        
        let alsoIncrementByTen = incrementByTen
        
        // 返回的值也为40
        print(alsoIncrementByTen())
    }
    
    //枚举
    func enumStudy() {
        
        //注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
        // 定义枚举
        enum DaysofaWeek {
            case Sunday
            case Monday
            case TUESDAY
            case WEDNESDAY
            case THURSDAY
            case FRIDAY
            case Saturday
        }
        
        var weekDay = DaysofaWeek.Sunday
        //weekDay的类型可以在它被DaysofaWeek的一个可能值初始化时推断出来。一旦weekDay被声明为一个DaysofaWeek，你可以使用一个缩写语法（.）将其设置为另一个DaysofaWeek的值：
        weekDay = .THURSDAY
        switch weekDay
        {
        case .Sunday:
            print("星期天")
        case .Monday:
            print("星期一")
        case .TUESDAY:
            print("星期二")
        case .WEDNESDAY:
            print("星期三")
        case .THURSDAY:
            print("星期四")
        case .FRIDAY:
            print("星期五")
        case .Saturday:
            print("星期六")
        }
        
        enum Month: Int {
            case January = 1, February, March, April, May, June, July, August, September, October, November, December
        }
        
        /*rawValue的本质是一个名为RawRepresentable的protocol：
        public protocol RawRepresentable {
            associatedtype RawValue
            public init?(rawValue: Self.RawValue)
            public var rawValue: Self.RawValue { get }
        }
         */
        
        enum Student{
            case Name(String)
            case Mark(Int,Int,Int)
        }
        
        //可以通过switch语法将Associated Value取出来
        let studDetails = Student.Name("sjh")
        let studMarks = Student.Mark(98,97,95)
        
        switch studMarks {
        case .Name(let studName):
            print("学生的名字是: \(studName)。")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        }
        
        switch studDetails {
        case .Name(let studName):
            print("学生的名字是: \(studName)。")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        }
    
    }

    
    //struct
    func structStudy() {
        struct studentMarks {
            var mark1 = 100
            var mark2 = 78
            var mark3 = 98
        }
        let tempMarks = studentMarks()
        print("Mark1 是 \(tempMarks.mark1)")
        print("Mark2 是 \(tempMarks.mark2)")
        print("Mark3 是 \(tempMarks.mark3)")
        
        struct markStruct{
            var mark1: Int
            var mark2: Int
            var mark3: Int
            
            init(mark1: Int, mark2: Int, mark3: Int){
                self.mark1 = mark1
                self.mark2 = mark2
                self.mark3 = mark3
            }
        }
        
        print("优异成绩:")
        let marks = markStruct(mark1: 98, mark2: 96, mark3:100)
        print(marks.mark1)
        print(marks.mark2)
        print(marks.mark3)
        
        print("糟糕成绩:")
        let fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
        print(fail.mark1)
        print(fail.mark2)
        print(fail.mark3)
        
    }
    
    //class
    func classStudy() {
        /*
         定义属性用于存储值
         定义方法用于提供功能
         定义附属脚本用于访问值
         定义构造器用于生成初始化值
         通过扩展以增加默认实现的功能
         符合协议以对某类提供标准功能
         与结构体相比，类还有如下的附加功能：
         继承允许一个类继承另一个类的特征
         类型转换允许在运行时检查和解释一个类实例的类型
         解构器允许一个类实例释放任何其所被分配的资源
         引用计数允许对一个类的多次引用
         */
        
        class MarksStruct {
            var mark: Int
            init(mark: Int) {
                self.mark = mark
            }
        }
        
        class studentMarks {
            var mark = 300
        }
        let marks = studentMarks()
        print("成绩为 \(marks.mark)")
        
    }


}
