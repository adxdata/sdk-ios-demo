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
- (void)onAdClicked:(MSFeedAdData *)feedAdData;

- (void)adShowByType:(NSInteger)SDKType feedAdData:(MSFeedAdData *)feedAdData;

- (void)adDetailWillShowByType:(NSInteger)SDKType;

- (void)adDetailClosedByType:(NSInteger)SDKType;

@end

@interface MSFeedAdData : NSObject

@property (nonatomic, weak) id<MSFeedAdDataDelegate> delegate;

@property (nonatomic, strong) MSAdModel *adModel;

@property (nonatomic, assign) BOOL showVideoDetail;

- (instancetype)initWithModel:(MSAdModel *)adModel;

- (MSFeedVideoView *)registerMediaView:(UIView *)container clickView:(UIView *)clickView vc:(UIViewController *)vc;

- (void)attachAd:(UIView *)view;

@end
