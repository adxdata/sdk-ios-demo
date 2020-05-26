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
- (void)rewardVideoAdDidLoad:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoLoaded: instead");
- (void)msRewardVideoLoaded:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频数据下载成功回调，已经下载过的视频会直接回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdVideoDidLoad:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoCached: instead");
- (void)msRewardVideoCached:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频播放页即将展示回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdWillVisible:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoShow: instead");
- (void)msRewardVideoWillShow:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频广告曝光回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidExposed:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoDetailShow: instead");
- (void)msRewardVideoShow:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频播放页关闭回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClose:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoClosed: instead");
- (void)msRewardVideoClosed:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频广告信息点击回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClicked:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoClicked: instead");
- (void)msRewardVideoClicked:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频广告各种错误信息回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)rewardVideoAd:(MSRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoError: instead");
- (void)msRewardVideoError:(MSRewardVideoAd *)msRewardVideoAd error:(NSError *)error;

/**
 视频广告播放达到激励条件回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidRewardEffective:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoRewarded: instead");
- (void)msRewardVideoReward:(MSRewardVideoAd *)msRewardVideoAd;

/**
 视频广告视频播放完成
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidPlayFinish:(MSRewardVideoAd *)rewardedVideoAd DEPRECATED_MSG_ATTRIBUTE("use msRewardVideoFinish: instead");
- (void)msRewardVideoFinish:(MSRewardVideoAd *)msRewardVideoAd;

@end

@interface MSRewardVideoAd : NSObject

@property (nonatomic, weak) id <MSRewardedVideoAdDelegate> delegate;

/**
 *  构造方法
 *  详解：controller - 当前UIViewController
 */
 - (instancetype)initWithCurController:(UIViewController*)controller;

- (instancetype)init;

/**
*  加载数据
*  详解：加载数据
*/
- (void)loadData:(NSString *)pid;

/**
 *  显示广告
 *  详解：显示广告
 */
 - (void)showAd;

 - (void)showAd:(UIViewController*)controller;

@end
