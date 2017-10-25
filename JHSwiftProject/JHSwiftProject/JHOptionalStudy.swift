//
//  JHOptionalStudy.swift
//  JHSwiftProject
//
//  Created by 作业帮 on 2017/10/25.
//  Copyright © 2017年 Shenjinghao. All rights reserved.
//

import UIKit

class JHOptionalStudy: NSObject {

    override init() {
        super.init()
        
        optionalStudy()
    }
    
    func optionalStudy() {
        let john = Person()
        
        // 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
        //想使用感叹号（!）强制解析获得这个人residence属性numberOfRooms属性值，将会引发运行时错误，因为这时没有可以供解析的residence值
        if let roomCount = john.residence?.number {
            print("John 的房间号为 \(roomCount)。")
        } else {
            print("不能查看房间号")
        }
        
        if ((john.residence?.printNumberOfRooms()) != nil) {
            print("输出房间号")
        } else {
            print("无法输出房间号")
        }
        
        let johnsHouse = Residence()
        johnsHouse.rooms.append(Room(name: "客厅"))
        johnsHouse.rooms.append(Room(name: "厨房"))
        john.residence = johnsHouse
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence!.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            print("John 所在的街道是 \(johnsStreet)。")
        } else {
            print("无法检索到地址。 ")
        }
        
        if let firstRoomName = john.residence?[0].name {
            print("第一个房间名为\(firstRoomName)")
        } else {
            print("无法检索到房间")
        }
    }
    
    class Person {
        var residence: Residence?
    }
    
    // 定义了一个变量 rooms，它被初始化为一个Room[]类型的空数组
    class Residence {
        var number = 1
        var rooms = [Room]()
        var numberOfRooms: Int {
            return rooms.count
        }
        subscript(i: Int) -> Room {
            return rooms[i]
        }
        func printNumberOfRooms() {
            print("房间号为 \(numberOfRooms)")
        }
        var address: Address?
    }
    
    // Room 定义一个name属性和一个设定room名的初始化器
    class Room {
        let name: String
        init(name: String) { self.name = name }
    }
    
    // 模型中的最终类叫做Address
    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if (buildingName != nil) {
                return buildingName
            } else if (buildingNumber != nil) {
                return buildingNumber
            } else {
                return nil
            }
        }
    }
    
    
}
