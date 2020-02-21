//
//  MSPrerenderAD.h
//  MSAdSDK
//
//  Created by zzq on 2020/2/19.
//  Copyright © 2020 yang. All rights reserved.
//
#import <UIKit/UIKit.h>

@class MSPrerenderAd;

@protocol MSPrerenderAdDelegate <NSObject>

@optional

/**
 *  请求广告条数据成功后调用
 *  详解:当接收服务器返回的广告数据成功后调用该函数
 */
- (void)msPrerenderLoaded:(MSPrerenderAd *)prerenderAd adViewArray:(NSArray *)adViewArray;

/**
 *  请求广告条数据失败后调用
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)msPrerenderError:(MSPrerenderAd *)prerenderAd error:(NSError *)error;

/**
 *  广告视图渲染成功
 *  详解:广告视图渲染成功后调用该函数
 */
- (void)msPrerenderRenderSuccess:(UIView *)adView;


/**
 *  广告视图渲染失败
 *  详解:广告视图渲染失败后调用该函数
 */
- (void)msPrerenderRenderError:(UIView *)adView error:(NSError *)error;

/**
 *  prerender广告曝光
 */
- (void)msPrerenderShow:(UIView *)adView;

/**
 *  prerender点击回调
 */
- (void)msPrerenderClicked:(UIView *)adView;

/**
 *  prerender条被用户关闭时调用
 *  详解:用户有可能点击关闭按钮从而把广告条关闭
 */
- (void)msPrerenderClosed:(UIView *)adView;

@end

@interface MSPrerenderAd : NSObject

/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSPrerenderAdDelegate> delegate;

/**
 *  构造方法
 *  详解：controller - pid 控制器和广告id
 */
- (instancetype)initWithCurController:(UIViewController*)controller;

/**
 *  加载广告
 *  详解：加载广告
 */
- (void)loadAd:(NSString *)pid;

#pragma mark - 各广告平台回调的公共回调
/**
 * 广告请求成功后调用
 */
- (void)adLoadSuccessByType:(NSInteger)SDKType adView:(NSArray *)adView;

/**
 * 各平台广告详加载失败时调用
 */
- (void)adLoadFailByType:(NSInteger)SDKType error:(NSError *)error;

/**
 * 广告渲染成功后调用
 */
- (void)adPrerenderSuccessByType:(NSInteger)SDKType adView:(UIView *)adView;

/**
 * 各平台广告渲染失败时调用
 */
- (void)adPrerenderFailByType:(NSInteger)SDKType adView:(UIView *)adView error:(NSError *)error;

/**
 * 各平台广告曝光时调用
 */
- (void)adShowByType:(NSInteger)SDKType adView:(UIView *)adView;

/**
 * 广告被点击后调用
 */
- (void)adClickedByType:(NSInteger)SDKType adView:(UIView *)adView;

/**
 * 各平台广告关闭时调用
 */
- (void)adClosedByType:(NSInteger)SDKType adView:(UIView *)adView;

@end
