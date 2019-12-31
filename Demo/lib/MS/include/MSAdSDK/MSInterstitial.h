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
- (void)interstitialSuccessToLoadAd:(MSInterstitial *)interstitial;

/**
 *  广告预加载失败回调
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)interstitialFailToLoadAd:(MSInterstitial *)interstitial error:(NSError *)error;

/**
 *  插屏广告视图展示成功回调
 *  详解: 插屏广告展示成功回调该函数
 */
- (void)interstitialDidPresentScreen:(MSInterstitial *)interstitial;

/**
 *  插屏广告展示结束回调
 *  详解: 插屏广告展示结束回调该函数
 */
- (void)interstitialDidDismissScreen:(MSInterstitial *)interstitial;

/**
 *  插屏广告点击回调
 */
- (void)interstitialClicked:(MSInterstitial *)interstitial;

/**
 *  全屏广告页被关闭
 */
- (void)interstitialAdDidDismissFullScreenModal:(MSInterstitial *)interstitial;

@end

@interface MSInterstitial : NSObject

/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSInterstitialDelegate> delegate;

/**
 *  构造方法
 *  详解：frame - banner 展示的位置和大小
 */
- (instancetype)initWithCurController:(UIViewController*)controller;

/**
 *  显示广告
 *  详解：显示广告
 */
- (void)showAd;

@end
