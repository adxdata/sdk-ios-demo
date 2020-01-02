//
//  MSNativeAd.h
//  MSAdSDK
//
//  Created by bwhx on 2019/11/25.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "MSAdModel.h"

NS_ASSUME_NONNULL_BEGIN
@class MSNativeAd;

@protocol MSNativeAdDelegate <NSObject>

/**
 *  原生广告加载广告数据成功回调，返回为GDTNativeAdData对象的数组
 */
- (void)nativeAdSuccessToLoad:(NSArray *)nativeAdDataArray;

/**
 *  原生广告加载广告数据失败回调
 */
- (void)nativeAdFailToLoad:(NSError *)error;

@optional
/**
 *  原生广告点击之后将要展示内嵌浏览器或应用内AppStore回调
 */
- (void)nativeAdWillPresentScreen;


/**
 * 原生广告点击以后，内置AppStore或是内置浏览器被关闭时回调
 */
- (void)nativeAdClosed;

@end

@interface MSNativeAd : NSObject<SKStoreProductViewControllerDelegate>


/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSNativeAdDelegate> delegate;

/**
 *  构造方法
 *  详解：appId - 媒体 ID
 *       placementId - 广告位 ID
 */
- (instancetype)initWithCurController:(UIViewController*)controller;

/**
 *  广告发起请求方法
 *  详解：[必选]发起拉取广告请求,在获得广告数据后回调delegate
 *  @param adCount 一次拉取广告的个数
 *  @param pid 广告id
 */
- (void)loadAd:(int)adCount pid:(NSString *)pid;

/**
 *  广告数据渲染完毕即将展示时调用方法
 *  详解：[必选]广告数据渲染完毕，即将展示时需调用本方法。
 *      @param nativeAdData 广告渲染的数据对象
 *      @param view         渲染出的广告结果页面
 */
- (void)attachAd:(MSAdModel *)nativeAdData toView:(UIView *)view indexPath:(NSIndexPath*)indexPath;
- (void)reloadAd;

@end

NS_ASSUME_NONNULL_END
