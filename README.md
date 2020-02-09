# 美数广告 SDK
### 接入流程
#### 1.嵌入广告SDK
将 sdk-ios-demo/demo/lib 中的 MSAdSDK.framework、MSBundle.bundle、Masonry、reachability 

#### 2.添加权限
info.plist里添加

    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>

#### 3.代码接入
请在您的 Application 初始化 sdk，代码如下

    #import <MSAdSDK/MSAdSDK.h>
    [MSAdSDK setAppId:@"101647"];    //传入在美数平台的appid
    [MSAdSDK setDebug:true];		//传true为测试环境，默认为 false 正式环境

#### 4.广告位代码接入
请参考 demo 代码


