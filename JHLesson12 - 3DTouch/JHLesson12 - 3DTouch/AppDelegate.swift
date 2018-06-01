//
//  AppDelegate.swift
//  JHLesson12 - 3DTouch
//
//  Created by 作业帮 on 2018/6/1.
//  Copyright © 2018年 JHSwift. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let VC = ViewController()
        
        let navigationC = UINavigationController(rootViewController: VC)
        self.window?.rootViewController = navigationC
        
        self.window?.backgroundColor = UIColor.white
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        // shortcutItem.type 就是 UIApplicationShortcutItemType 的值
        // TODO: 只要是3D touch 入口，都会触发到这里的
        //<UIApplicationShortcutItem: 0x6040004779c0; type: Share, title: Share1>
        let nav : UINavigationController = self.window?.rootViewController as! UINavigationController
        let first : FirstViewController = FirstViewController()
        switch shortcutItem.localizedTitle {
        case "Share":
            first.backImageName = "image1"
            nav.pushViewController(first, animated: true)
            return
        default:
            first.backImageName = "Steve"
            nav.pushViewController(first, animated: true)
            return
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

