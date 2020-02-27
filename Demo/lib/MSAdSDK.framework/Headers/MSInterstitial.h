//
//  MSInterstitial.h
//  MSAdSDK
//
//  Created by yang on 2019/8/18.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MSInterstitial;

@protocol MSInterstitialDelegate <NSObject>

@optional

/**
 *  广告预加载成功回调
 *  详解:当接收服务器返回的广告数据成功且预加载后调用该函数
 */
- (void)interstitialSuccessToLoadAd:(MSInterstitial *)interstitial DEPRECATED_MSG_ATTRIBUTE("use msInterstitialLoaded: instead");
- (void)msInterstitialLoaded:(MSInterstitial *)msInterstitialAd;

/**
 *  广告预加载失败回调
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)interstitialFailToLoadAd:(MSInterstitial *)interstitial error:(NSError *)error DEPRECATED_MSG_ATTRIBUTE("use msInterstitialError: instead");
- (void)msInterstitialError:(MSInterstitial *)msInterstitialAd error:(NSError *)error;

/**
 *  插屏广告视图展示成功回调
 *  详解: 插屏广告展示成功回调该函数
 */
- (void)interstitialDidPresentScreen:(MSInterstitial *)interstitial DEPRECATED_MSG_ATTRIBUTE("use msInterstitialShow: instead");
- (void)msInterstitialShow:(MSInterstitial *)msInterstitialAd;

/**
 *  插屏广告展示结束回调
 *  详解: 插屏广告展示结束回调该函数
 */
- (void)interstitialDidDismissScreen:(MSInterstitial *)interstitial DEPRECATED_MSG_ATTRIBUTE("use msInterstitialClosed: instead");
- (void)msInterstitialClosed:(MSInterstitial *)msInterstitialAd;

/**
 *  插屏广告点击回调
 */
- (void)interstitialClicked:(MSInterstitial *)interstitial DEPRECATED_MSG_ATTRIBUTE("use msInterstitialClicked: instead");
- (void)msInterstitialClicked:(MSInterstitial *)msInterstitialAd;

/**
 *  全屏广告页被关闭
 */
- (void)interstitialAdDidDismissFullScreenModal:(MSInterstitial *)interstitial DEPRECATED_MSG_ATTRIBUTE("use msInterstitialDetailClosed: instead");
- (void)msInterstitialDetailClosed:(MSInterstitial *)msInterstitialAd;

@end

@interface MSInterstitial : NSObject

/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSInterstitialDelegate> delegate;

/**
 *  构造方法
 *  详解：controller - 当前界面
 */
- (instancetype)initWithCurController:(UIViewController*)controller;

/**
 *  加载广告
 *  详解：pid - 广告位 id
 */
- (void)loadAd:(NSString *)pid;

/**
 *  显示广告
 *  详解：显示广告
 */
- (void)showAd;

@end
