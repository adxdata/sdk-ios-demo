//
//  MSAdModel+VideoFeed.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/4.
//  Copyright © 2020 yang. All rights reserved.
//
#import "MSFeedVideoView.h"

@interface MSAdModel (VideoFeed)

@property (nonatomic, strong) MSNativeAd *nativeAd;

@property (nonatomic, assign) BOOL didShowAdDetail;

- (MSFeedVideoView *)registerMediaView:(UIView *)container clickView:(UIView *)clickView vc:(UIViewController *)vc;

@end
