//
//  GDTSDKDefines.h
//  GDTMobApp
//
//  Created by royqpwang on 2017/11/6.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MSConfiger.h"
#import "MSCommCore.h"

static NSString *kMSVersionName = @"0.8.13";
static NSInteger kMSVersionCode = 38;

//是否是竖屏
#define IsPortrait ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

#define MSWS(weakSelf) __weak __typeof(&*self)weakSelf = self;

// RGB颜色转换（16进制->10进制）
#define MSUIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define MSUIColorFromRGBA(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbValue & 0xFF0000) >> 26))/255.0 \
blue:((float)(rgbValue & 0xFF00 >> 8))/255.0 \
alpha:((float)(rgbValue & 0xFF))/255.0]

#define msScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define msScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define msIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define msIs_iPhoneX msScreenWidth >=375.0f && msScreenHeight >=812.0f&& msIs_iphone

/*状态栏高度*/
#define msStatusBarHeight (CGFloat)(msIs_iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define msNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define msNavBarAndStatusBarHeight (CGFloat)(msIs_iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define msTabBarHeight (CGFloat)(msIs_iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define msTopBarSafeHeight (CGFloat)(msIs_iPhoneX?(44.0):(0))
 /*底部安全区域远离高度*/
#define msBottomSafeHeight (CGFloat)(msIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define msTopBarDifHeight (CGFloat)(msIs_iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define msNavAndTabHeight (msNavBarAndStatusBarHeight + msTabBarHeight)

typedef NS_ENUM(NSInteger, MSShowType) {
    MSShowTypeMS = 0, // 展示美数
    MSShowTypeGDT = 1, // 展示广点通
    MSShowTypeBU = 2, // 展示穿山甲
    MSShowTypeBD = 3, // 展示百度
};

typedef NS_ENUM(NSInteger, MSReportType) {
    MSReportLB = 0, // 加载广告前
    MSReportLS = 1, // 加载广告成功
    MSReportShow = 2, // 曝光
    MSReportClick = 3, // 点击
};

typedef NS_ENUM(NSInteger, MSOrientation) {
    MSOrientationPortrait = 0, // 展示竖屏
    MSOrientationLandscapeRight = 1, // 展示横屏
};

typedef NS_ENUM(NSInteger, MSSecure) {
    MSSecureHttp = 0,   // 仅支持http
    MSSecureHttps = 1,  // 仅支持https
    MSSecureAll = 2,    // 仅支持https
};


typedef NS_ENUM(NSInteger, MSNativeAdViewShowType) {
    MSLeftImage= 0,     // 展示左图右文+下载按钮
    MSLeftImageNoButton = 1, // 展示左图右文
    MSBottomImage = 2,  // 展示上文下大图
    MSThreeImage = 3,   // 三图
    MSVideo = 4,        // 视频
};

typedef NS_ENUM(NSInteger, MSDetailType) {
    MSDetailPage = 0, // 详情页
    MSDetailApp = 1, // 跳转app
};

typedef NS_ENUM(NSInteger, MSTargetType) {
    MSTargetTypeDetail = 0,     // 详情页
    MSTargetTypeDownload = 1,   // 下载
};

static NSString *kMSGDTMobSDKAppId = @"1105344611";

static NSString *kMSBUMobSDKAppId = @"5000546";

#define  BASIC_URL @"http://123.59.48.113/sdk/req_ad"
//#define  BASIC_URL @"http://47.112.204.11:8080/req_ad_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_only_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_sdk?sdk=csj"
//#define  BASIC_URL [MSConfiger share].baseUrl


