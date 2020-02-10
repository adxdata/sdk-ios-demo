# 美数广告 SDK
### 接入流程
#### 1.嵌入广告SDK
将 sdk-ios-demo/demo/lib 中的 MSAdSDK.framework、MSBundle.bundle、Masonry、reachability、BUAdSDK.framework、BUAdSDK.bundle、BaiduMobAdSDK.framework、GDT 引入项目

#### 2.允许http请求
info.plist里添加

    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>

#### 3.代码接入
请在您的 AppDelegate 初始化 sdk，代码如下：

    #import <MSAdSDK/MSAdSDK.h>
    
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        [MSAdSDK setAppId:@"101647"];    //传入在美数平台的appid
    }

在 main.m 中，引入MRApplication，代码如下：

    #import "AppDelegate.h"
    #import <MSAdSDK/MSAdSDK.h>
    
    int main(int argc, char * argv[]) {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, NSStringFromClass([MRApplication class]), NSStringFromClass([AppDelegate class]));
        }
    }

#### 4.广告位代码接入
请参考 demo 代码


