//
//  MSPlatformLoaderFactory.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/13.
//  Copyright © 2020 yang. All rights reserved.
//

#import "MSPlatformLoader.h"

@interface MSPlatformLoaderFactory : NSObject

/** 开屏广告loader */
- (MSPlatformLoader *)splashLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** banner广告loader */
- (MSPlatformLoader *)bannerLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** 插屏广告loader */
- (MSPlatformLoader *)interstitialLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** 激励视频广告loader */
- (MSPlatformLoader *)rewardLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** feed流广告loader */
- (MSPlatformLoader *)feedLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** draw广告loader */
- (MSPlatformLoader *)drawLoader:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

@end
