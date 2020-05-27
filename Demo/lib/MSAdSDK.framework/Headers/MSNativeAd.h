//
//  MSNativeAd.h
//  MSAdSDK
//
//  Created by bwhx on 2019/11/25.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MSFeedAdData.h"

NS_ASSUME_NONNULL_BEGIN
@class MSNativeAd;

@protocol MSNativeAdDelegate <NSObject>

@optional

/**
 *  原生广告加载广告数据成功回调，返回为MSFeedAdData对象的数组
 */
- (void)nativeAdSuccessToLoad:(NSArray *)nativeAdDataArray DEPRECATED_MSG_ATTRIBUTE("use msNativeLoaded: instead");
- (void)msNativeLoaded:(NSArray *)nativeAdDataArray;

/**
 *  原生广告加载广告数据失败回调
 */
- (void)nativeAdFailToLoad:(NSError *)error DEPRECATED_MSG_ATTRIBUTE("use msNativeError: instead");
- (void)msNativeError:(NSError *)error;

/**
 *  原生广告即将展现
 */
- (void)nativeAdShow:(MSFeedAdData *)feedAdData DEPRECATED_MSG_ATTRIBUTE("use msNativeShow: instead");
- (void)msNativeShow:(MSFeedAdData *)feedAdData;

/**
 *  广告被点击
 */
- (void)msNativeClick:(MSFeedAdData *)feedAdData;

/**
 *  原生广告点击之后将要展示内嵌浏览器或应用内AppStore回调
 */
- (void)nativeAdWillPresentScreen DEPRECATED_MSG_ATTRIBUTE("use msNativeDetailShow: instead");
- (void)msNativeDetailShow;

/**
 * 原生广告点击以后，内置AppStore或是内置浏览器被关闭时回调
 */
- (void)nativeAdClosed DEPRECATED_MSG_ATTRIBUTE("use msNativeDetailClosed: instead");
- (void)msNativeDetailClosed;

@end

@interface MSNativeAd : NSObject<SKStoreProductViewControllerDelegate>


/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSNativeAdDelegate> delegate;

/**
 * 视频广告是否显示视频详情页面，默认为 NO，点击直接跳转网页，设置为YES时，点击后显示视频详情页面
 */
@property (nonatomic, assign) BOOL showVideoDetail;

/*
 *  viewController
 *  详解：开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *viewController;

/**
 *  构造方法
 *  详解：appId - 媒体 ID
 *       placementId - 广告位 ID
 */
 - (instancetype)initWithCurController:(UIViewController*)controller;

/**
 *  广告发起请求方法
 *  详解：[必选]发起拉取广告请求,在获得广告数据后回调delegate
 *  @param adCount 一次拉取广告的个数，目前仅应用于穿山甲，美数一次只能取一个，百度每次只能取3个
 *  @param pid 广告id
 */
- (void)loadAd:(int)adCount pid:(NSString *)pid;

- (void)reloadAd;

@end

NS_ASSUME_NONNULL_END
