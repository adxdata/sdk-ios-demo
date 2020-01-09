//
//  VideoViewController.m
//  Demo
//
//  Created by zzq on 2020/1/8.
//  Copyright © 2020 bwhx. All rights reserved.
//

#import "VideoViewController.h"
#import <MSAdSDK/MSVideoAd.h>
#import "IdProviderFactory.h"

@interface VideoViewController () <MSVideoAdDelegate>

@property (strong, nonatomic) MSVideoAd *videoAd;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAd];
}

- (void)loadAd {
    self.videoAd = [[MSVideoAd alloc]init];
    self.videoAd.delegate = self;
    NSString *pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] video];
    [self.videoAd loadAdAndShow:self.container frame:self.container.frame pid:pid];
}

/**
 *  视频广告成功展示
 */
- (void)msVideoShow:(MSVideoAd *)videoAd {
    NSLog(@"视频广告曝光");
}

/**
 *  视频广告展示失败
 */
- (void)msVideoError:(MSVideoAd *)videoAd error:(NSError *)error {
    NSLog(@"视频广告加载失败");
}

/**
 *  视频广告点击回调
 */
- (void)msVideoClick:(MSVideoAd *)splashAd {
    NSLog(@"视频广告被点击");
}

/**
 *  视频广告将要关闭回调
 */
- (void)msVideoCompletion:(MSVideoAd *)splashAd {
    NSLog(@"视频广告播放完成");
}

@end
