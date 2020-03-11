//
//  MSAdSDK.h
//  MSAdSDK
//
//  Created by yang on 2019/8/5.
//  Copyright © 2019年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MSAdSDK/MSAdModel.h>
#import <MSAdSDK/MSSDKModel.h>
#import <MSAdSDK/MSCommCore.h>
#import <MSAdSDK/MSBannerView.h>
#import <MSAdSDK/MSInterstitial.h>
#import <MSAdSDK/MSNativeAdView.h>
#import <MSAdSDK/MSRewardVideoAd.h>
#import <MSAdSDK/MSSplashAd.h>
#import <MSAdSDK/MSSDKDefines.h>
#import <MSAdSDK/MRApplication.h>
#import <MSAdSDK/MSNativeAd.h>
#import <MSAdSDK/MSVideoAd.h>
#import <MSAdSDK/MSFeedVideoView.h>
#import <MSAdSDK/MSFeedAdData.h>
#import <MSAdSDK/MSConfig.h>

@interface MSAdSDK : NSObject

+ (void)setAppId:(NSString *)appId;

+ (NSString *)appId;

+ (void)setTestMode:(BOOL)isTestMode;

+ (NSString *)getVersionName;

+ (NSInteger)getVersionCode;

/**
 * 0 - 只支持 http 协议
 * 1 - 只支持 https 协议
 * 2 - http、https 协议都支持（默认值）
 */
+ (void)setSecure:(NSInteger)secure;

+ (void)setHttpsSupport:(BOOL)isSupportHttps;

@end
