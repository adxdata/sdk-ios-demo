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

@interface MSAdSDK : NSObject

+ (void)setAppId:(NSString *)appId;

+ (NSString *)appId;

+ (void)setDebug:(BOOL)isDebug;

+ (NSString *)getVersionName;

+ (NSInteger)getVersionCode;

@end
