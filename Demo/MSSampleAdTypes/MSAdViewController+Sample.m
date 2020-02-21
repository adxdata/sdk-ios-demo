//
//  GDTAdViewController+Sample.m
//  GDTMobApp
//
//  Created by royqpwang on 2019/3/26.
//  Copyright © 2019 Tencent. All rights reserved.
//

#import "MSAdViewController+Sample.h"

@implementation MSAdViewController (Sample)

- (void)loadView {
    [super loadView];
    self.demoArray = [@[
                        @[@"开屏广告", @"SplashViewController"],
                        @[@"Banner", @"BannerViewController"],
                        @[@"插屏", @"InterstitialViewController"],
                        @[@"激励视频广告", @"RewardVideoViewController"],
                        @[@"信息流", @"MSNativeAdController"],
                        @[@"视频广告", @"VideoViewController"],
                        @[@"模板信息流广告", @"PreRenderViewController"]
                        ] mutableCopy];
}

@end
