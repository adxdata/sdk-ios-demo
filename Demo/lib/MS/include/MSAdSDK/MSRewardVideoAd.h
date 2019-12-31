//
//  MSRewardVideoAd.h
//  MSAdSDK
//
//  Created by yang on 2019/8/18.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MSSDKDefines.h"

@class MSRewardVideoAd;
@protocol MSRewardedVideoAdDelegate <NSObject>

@optional


/**
 广告数据加载成功回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidLoad:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频数据下载成功回调，已经下载过的视频会直接回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdVideoDidLoad:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频播放页即将展示回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdWillVisible:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频广告曝光回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidExposed:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频播放页关闭回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClose:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频广告信息点击回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClicked:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频广告各种错误信息回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)rewardVideoAd:(MSRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error;

/**
 视频广告播放达到激励条件回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidRewardEffective:(MSRewardVideoAd *)rewardedVideoAd;

/**
 视频广告视频播放完成
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidPlayFinish:(MSRewardVideoAd *)rewardedVideoAd;

@end

@interface MSRewardVideoAd : NSObject

@property (nonatomic, weak) id <MSRewardedVideoAdDelegate> delegate;

/**
 *  构造方法
 *  详解：frame - banner 展示的位置和大小
 */
- (instancetype)initWithCurController:(UIViewController*)controller;

/**
*  加载数据
*  详解：加载数据
*/
- (void)loadData;

/**
 *  显示广告
 *  详解：显示广告
 */
- (void)showAd;

@end


