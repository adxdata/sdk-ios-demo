//
//  MSPlatformLoader.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/13.
//  Copyright © 2020 yang. All rights reserved.
//
#import "MSAdLoader.h"

@class MSAdLoader;

@interface MSPlatformLoader : NSObject

/** 广告加载器 */
@property (nonatomic, weak)MSAdLoader *adLoader;

/** 下一个优先级广告平台加载器 */
@property (nonatomic, strong)MSPlatformLoader *next;

/** 广告数据 */
@property (strong, nonatomic)MSAdModel *adModel;

/** 平台广告数据 */
@property (strong, nonatomic)MSSDKModel *sdkModel;

/** 平台广告数据 */
@property (nonatomic, assign)MSShowType showType;

/** 广告是否正在显示 */
@property (nonatomic, assign) BOOL adShow;

/** 构造方法 */
- (instancetype) initWithModel:(MSAdModel *)adModel sdkModel:(MSSDKModel *)sdkModel;

/** 加载平台广告 */
- (void)loadPlatformAd;

/**
 * 各平台广告加载成功时调用
 */
- (void)platformAdLoadSuccess;

/**
 * 各广告平台加载失败时调用
 */
- (void)platformLoadError:(NSError *)error;

/**
 * 所有广告加载都失败时调用此方法
 */
- (void)adLoadError:(NSError *)error;

/**
 * 各平台广告曝光成功时调用
 */
- (void)platformAdShow;

/**
 * 各平台广告被点击时调用
 */
- (void)platformAdClicked;

/**
 * 各平台广告被点击时调用
 */
- (void)platformAdClosed;

/**
 * 各平台广告详情页关闭时调用
 */
- (void)platformAdDetailClosed;

/**
 * 各平台广告被跳过时调用
 */
- (void)platformAdSkip;

@end
