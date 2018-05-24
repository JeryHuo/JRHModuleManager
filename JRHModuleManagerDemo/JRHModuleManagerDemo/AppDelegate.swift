//
//  AppDelegate.swift
//  JRHModuleManagerDemo
//
//  Created by huojiarong on 2018/3/22.
//  Copyright © 2018年 huojiarong. All rights reserved.
//

import UIKit
import JRHModuleManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /// APP启动
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let plistPath = Bundle.main.path(forResource: "JRHModuleManager", ofType: "plist")!
        JRHModuleManager.shareInstance().loadModulesWithPlistFile(filePath: plistPath);
        let res = JRHModuleManager.shareInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return res
    }

    /// 进入后台
    func applicationDidEnterBackground(_ application: UIApplication) {
        JRHModuleManager.shareInstance().applicationDidEnterBackground(application)
    }
    
    /// 从后台返回
    func applicationWillEnterForeground(_ application: UIApplication) {
        JRHModuleManager.shareInstance().applicationWillEnterForeground(application)
    }
    
    /// 关闭应用
    func applicationWillTerminate(_ application: UIApplication) {
        JRHModuleManager.shareInstance().applicationWillTerminate(application)
    }

    /// 获取deviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JRHModuleManager.shareInstance().application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    /// 获取deviceToken失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        JRHModuleManager.shareInstance().application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    /// 收到远程推送
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        JRHModuleManager.shareInstance().application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    /// 后台播放音频
    func applicationWillResignActive(_ application: UIApplication) {
        JRHModuleManager.shareInstance().applicationWillResignActive(application)
    }
    
    /// 第三方跳转回调处理
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let res = JRHModuleManager.shareInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return res
    }

}

