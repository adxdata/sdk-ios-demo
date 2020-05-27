//
//  MSFeedAdData.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/5.
//  Copyright © 2020 yang. All rights reserved.
//

#import "MSFeedVideoView.h"

@class MSFeedAdData;

@protocol MSFeedAdDataDelegate <NSObject>

/**
 * 当广告被点击时触发
 */
- (void)onAdClicked:(MSFeedAdData *)feedAdData view:(UIView *)view;

- (void)adShowByType:(NSInteger)SDKType feedAdData:(MSFeedAdData *)feedAdData;

- (void)adDetailWillShowByType:(NSInteger)SDKType feedAdData:(MSFeedAdData *)feedAdData ;

- (void)adDetailClosedByType:(NSInteger)SDKType;

@end

@interface MSFeedAdData : NSObject

@property (nonatomic, weak) id<MSFeedAdDataDelegate> delegate;

@property (nonatomic, strong) MSAdModel *adModel;

@property (nonatomic, assign) BOOL showVideoDetail;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) NSInteger showType;

/*
 *  viewController
 *  详解：开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *viewController;

/**
 * 广点通广告对象
 */
@property (nonatomic, strong) id gdtNativeAd;
@property (nonatomic, strong) id gdtNativeData;

/**
 * 穿山甲广告对象
 */
@property (nonatomic, strong) id buNativeAd;

/**
 * 百度广告对象
 */
@property (nonatomic, strong) id bdNativeAd;
@property (nonatomic, strong) id bdNativeData;

- (instancetype)initWithModel:(MSAdModel *)adModel;

- (MSFeedVideoView *)registerMediaView:(UIView *)container clickView:(UIView *)clickView vc:(UIViewController *)vc;

- (void)attachAd:(UIView *)view;

@end
