//
//  MSAdLoader.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/13.
//  Copyright © 2020 yang. All rights reserved.
//

#import "MSPlatformLoader.h"
#import "MSPlatformLoaderFactory.h"

@interface MSAdLoader : NSObject

/** 广告位id */
@property (nonatomic, strong) NSString *pid;

/** 广告数据模型 */
@property (strong, nonatomic)MSAdModel *adModel;

/** 广告类型 */
@property (assign, nonatomic)MSAdType adType;

/** 平台广告加载器 */
@property (strong, nonatomic)MSPlatformLoader *platformLoader;

/** 点击事件开始位置 */
@property (strong, nonatomic)NSMutableDictionary *beganDict;

/** 点击事件结束位置 */
@property (strong, nonatomic)NSMutableDictionary *endDict;

/** 平台广告加载器工厂字典 */
@property (strong, nonatomic)NSDictionary *platformLoaderFactorys;

@property (strong, nonatomic)MSPlatformLoader *currentPlatformLoader;

/** 广告是否被取消显示 */
@property (nonatomic, assign) BOOL canceled;

/**
 *  拉取广告超时时间，默认为3秒
 *  详解：拉取广告超时时间，超过此时间则放弃此次广告展示机会。
 */
@property (nonatomic, assign) NSInteger fetchDelay;

/*
 * 访问美数服务器，加载广告数据
 */
- (void)loadAd:(NSString *)pid;

/**
 * 加载广告数据成功后调用此方法
 */
- (void)onAdLoaded:(MSAdModel *)adModel;

/**
 * 加载广告数据失败后调用此方法
 */
- (void)onAdLoadError:(NSError *)error;

/** 创建平台广告加载器 */
- (MSPlatformLoader *)createPlatformLoaderByFactory:(MSPlatformLoaderFactory *)factory adModel:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

@end
