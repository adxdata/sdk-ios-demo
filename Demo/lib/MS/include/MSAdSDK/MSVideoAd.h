//
//  MSVideoAd.h
//  MSAdSDK
//
//  Created by zzq on 2020/1/8.
//  Copyright © 2020 yang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MSVideoAd;

@protocol MSVideoAdDelegate <NSObject>

@optional
/**
 *  视频广告成功展示
 */
- (void)msVideoShow:(MSVideoAd *)videoAd;

/**
 *  视频广告展示失败
 */
- (void)msVideoError:(MSVideoAd *)videoAd error:(NSError *)error;

/**
 *  视频广告点击回调
 */
- (void)msVideoClick:(MSVideoAd *)splashAd;

/**
 *  视频广告将要关闭回调
 */
- (void)msVideoCompletion:(MSVideoAd *)splashAd;


@end

@interface MSVideoAd : NSObject

/**
 *  委托对象
 */
@property (nonatomic, weak) id<MSVideoAdDelegate> delegate;

/**
 * 获取并展示视频广告
 *  @param container 展示视频的容器
 *  @param pid 广告id
 */
- (void)loadAdAndShow:(UIView *)container frame:(CGRect)frame pid:(NSString *)pid;

/**
 * 切换横竖屏方向
 */
- (void)changeOrientation:(UIInterfaceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END