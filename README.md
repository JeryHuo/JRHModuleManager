# JRHModuleManager
## 简介
AppDelegate瘦身方案Swift版本，需要先提前注册需要瘦身的模块，然后在```AppDelegate```中的代理方法中调用一个中间件```JRHModuleManager```，```JRHModuleManager```负责集中分发给已经注册并且实现协议的模块。
## CocoaPods导入
```pod 'JRHModuleManager', '~> 1.0.5' ```
## 使用
在```AppDelegate.swift ```文件中的```didFinishLaunchingWithOptions ```方法中注册模块，只需要注册一次
### tips
可以创建plist文件来管理需要注册的模块，以便方便维护
### 调用 
```
// 1. 先提前注册模块，只需要注册一次
let plistPath = Bundle.main.path(forResource: "JRHModuleManager", ofType: "plist")!
JRHModuleManager.shareInstance().loadModulesWithPlistFile(filePath: plistPath)

// 2. 在App启动的时候调用模块
let res = JRHModuleManager.shareInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
```
同样的道理，可以给AppDelegate的任何方法进行瘦身
```
/// 进入后台/退出程序
func applicationDidEnterBackground(_ application: UIApplication) {
    let res = JRHModuleManager.shareInstance().applicationDidEnterBackground(application)
    return res
}
    
/// 从后台回来点击进入应用
func applicationWillEnterForeground(_ application: UIApplication) {
    JRHModuleManager.shareInstance().applicationWillEnterForeground(application)
}
 
/// 关闭程序
func applicationWillTerminate(_ application: UIApplication) {
    JRHModuleManager.shareInstance().applicationWillTerminate(application)
}
```
最后在具体的类中去操作，也之前已经注册好的的模块类中去操作，假设我们有一个已经注册了的```AppTimeLineModule.swift```的模块, 那么就在此类中实现相应需要处理的方法
```
/// App启动
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    print("didFinishLaunchingWithOptions")
    // code ...
    return true
}
    
/// 进入后台/退出程序    
func applicationDidEnterBackground(_ application: UIApplication) {
    print("applicationDidEnterBackground")
    // code ...
}
 
/// 从后台回来点击进入应用   
func applicationWillEnterForeground(_ application: UIApplication) {
    print("applicationWillEnterForeground")
    // code ...
}
 
/// 关闭程序  
func applicationWillTerminate(_ application: UIApplication) {
    print("applicationWillTerminate")
    // code ...
}
```
