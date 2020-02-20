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

static NSString *kMSVersionName = @"0.1.1";
static NSInteger kMSVersionCode = 23;

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

#define sdkType        @"gdt"

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


typedef NS_ENUM(NSInteger, MSNativeAdViewShowType) {
    MSLeftImage= 0, // 展示左图右文+下载按钮
    MSLeftImageNoButton = 1, // 展示左图右文
    MSBottomImage = 2, // 展示上文下大图
};


typedef NS_ENUM(NSInteger, MSDetailType) {
    MSDetailPage = 0, // 详情页
    MSDetailApp = 1, // 跳转app
};

static NSString *kMSGDTMobSDKAppId = @"1105344611";

static NSString *kMSBUMobSDKAppId = @"5000546";

#define  BASIC_URL @"http://123.59.48.113/sdk/req_ad"
//#define  BASIC_URL @"http://47.112.204.11:8080/req_ad_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_only_sdk"
//#define  BASIC_URL @"http://47.112.204.11:8080/ios_req_ad_sdk?sdk=csj"
//#define  BASIC_URL [MSConfiger share].baseUrl


