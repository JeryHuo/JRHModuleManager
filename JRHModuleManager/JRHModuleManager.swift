//
//  JRHModuleManager.swift
//  JRHModuleManagerDemo
//
//  Created by huojiarong on 2018/3/21.
//  Copyright © 2018年 huojiarong. All rights reserved.
//

import UIKit

protocol YLModuleDelegate: UIApplicationDelegate{
    
}

class YLModuleManager: NSObject, UIApplicationDelegate{
    
    var modules:[YLModuleDelegate] = []
    private static let singleInstance = YLModuleManager()
    
    
    
    // MARK: publick
    class func shareInstance() -> YLModuleManager {
        return .singleInstance
    }
    
    func loadModulesWithPlistFile(filePath: String) {
        let moduleNames: NSArray = NSArray.init(contentsOfFile: filePath)!
        let moduleNameArr: Array = moduleNames as! [String]
        modules.removeAll()
        for moduleName in moduleNameArr {
            // swift中在使用NSClassFromString,字符串转类型时,如果是自定义的类,需要+项目名称+.才可以获取到.
            let name: String = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let cls = NSClassFromString(name + "." + moduleName) as! NSObject.Type
            let moduleCls = cls.init()
            modules.append(moduleCls as! YLModuleDelegate)
        }
    }
    
    func allModules() -> Array<YLModuleDelegate> {
        return modules
    }
    
    
    
    // MARK: 启动
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        for module in modules {
            _ = module.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }
    
    
    
    // MARK: 操作
    // 进入后台/退出程序
    func applicationDidEnterBackground(_ application: UIApplication) {
        for module in modules {
            _ = module.applicationDidEnterBackground?(application)
        }
    }
    // 从后台回来点击进入应用
    func applicationWillEnterForeground(_ application: UIApplication) {
        for module in modules {
            _ = module.applicationWillEnterForeground?(application)
        }
    }
    // 关闭应用
    func applicationWillTerminate(_ application: UIApplication) {
        for module in modules {
            _ = module.applicationWillTerminate?(application)
        }
    }
    
    
    
    // MARK: 推送
    // 获取deviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        for module in modules {
            _ = module.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
    // 获取deviceToken失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        for module in modules {
            _ = module.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }
    // 收到通知
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        for module in modules {
            _ = module.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }
    }
    
    
    
    // MARK: 后台播放音频
    func applicationWillResignActive(_ application: UIApplication) {
        for module in modules {
            _ = module.applicationWillResignActive?(application)
        }
    }
    
    
    
    // MARK: 第三方跳转回调处理
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var res = false
        for module in modules {
            res = (module.application?(application, open: url, sourceApplication: sourceApplication, annotation: annotation))!
        }
        return res
    }
}


