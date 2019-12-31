//
//  RewardVideoViewController.m
//  GDTMobApp
//
//  Created by royqpwang on 2018/9/5.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "RewardVideoViewController.h"
#import "MSRewardVideoAd.h"

@interface RewardVideoViewController () <MSRewardedVideoAdDelegate>

@property (nonatomic, strong) MSRewardVideoAd *rewardVideoAd;
@property (weak, nonatomic) IBOutlet UITextField *portraitPlacementIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *placementIdTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic, assign) UIInterfaceOrientation supportOrientation;
@property (weak, nonatomic) IBOutlet UIButton *portraitButton;
@property (weak, nonatomic) IBOutlet UIButton *botnButton;

@end

@implementation RewardVideoViewController

- (void)viewDidLoad {
    self.supportOrientation = UIInterfaceOrientationPortrait;
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (IBAction)loadAd:(id)sender {
    if (sender == self.portraitButton) {
        NSString *placementId = self.portraitPlacementIdTextField.text.length > 0 ?self.portraitPlacementIdTextField.text: self.portraitPlacementIdTextField.placeholder;
        self.rewardVideoAd = [[MSRewardVideoAd alloc] initWithCurController:self];
    } else {
        NSString *placementId = self.placementIdTextField.text.length > 0 ?self.placementIdTextField.text: self.placementIdTextField.placeholder;
        self.rewardVideoAd = [[MSRewardVideoAd alloc] initWithCurController:self];
    }
    self.rewardVideoAd.delegate = self;
    //加载数据
    [self.rewardVideoAd loadData];
}

- (IBAction)playVideo:(UIButton *)sender {
    [self.rewardVideoAd showAd];
}

- (IBAction)changeOrientation:(UIButton *)sender {
    // 仅为方便调试提供的逻辑，应用接入流程中不需要程序设置方向
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        self.supportOrientation = UIInterfaceOrientationLandscapeRight;
    } else {
        self.supportOrientation = UIInterfaceOrientationPortrait;
    }
    [[UIDevice currentDevice] setValue:@(self.supportOrientation) forKey:@"orientation"];
}

#pragma mark - GDTRewardVideoAdDelegate

/**
 广告数据加载成功回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidLoad:(MSRewardVideoAd *)rewardedVideoAd{
    self.statusLabel.text = @"广告数据加载成功";
}

/**
 视频数据下载成功回调，已经下载过的视频会直接回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdVideoDidLoad:(MSRewardVideoAd *)rewardedVideoAd{
    self.statusLabel.text = @"视频文件加载成功";
}

/**
 视频播放页即将展示回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdWillVisible:(MSRewardVideoAd *)rewardedVideoAd{
//    NSLog(@"视频播放页即将打开");
}

/**
 视频广告曝光回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidExposed:(MSRewardVideoAd *)rewardedVideoAd{
//    NSLog(@"广告已曝光");
}

/**
 视频播放页关闭回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClose:(MSRewardVideoAd *)rewardedVideoAd{
    self.statusLabel.text = @"广告已关闭";
//    NSLog(@"广告已关闭");
    self.rewardVideoAd = nil;
}

/**
 视频广告信息点击回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidClicked:(MSRewardVideoAd *)rewardedVideoAd{
//    NSLog(@"广告已点击");
}

/**
 视频广告各种错误信息回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)rewardVideoAd:(MSRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error{
    if (error.code == 4014) {
//        NSLog(@"请拉取到广告后再调用展示接口");
        self.statusLabel.text = @"请拉取到广告后再调用展示接口";
    } else if (error.code == 4016) {
//        NSLog(@"应用方向与广告位支持方向不一致");
        self.statusLabel.text = @"应用方向与广告位支持方向不一致";
    } else if (error.code == 5012) {
//        NSLog(@"广告已过期");
        self.statusLabel.text = @"广告已过期";
    } else if (error.code == 4015) {
//        NSLog(@"广告已经播放过，请重新拉取");
        self.statusLabel.text = @"广告已经播放过，请重新拉取";
    } else if (error.code == 5002) {
//        NSLog(@"视频下载失败");
        self.statusLabel.text = @"视频下载失败";
    } else if (error.code == 5003) {
//        NSLog(@"视频播放失败");
        self.statusLabel.text = @"视频播放失败";
    } else if (error.code == 5004) {
//        NSLog(@"没有合适的广告");
        self.statusLabel.text = @"没有合适的广告";
    } else if (error.code == 5013) {
//        NSLog(@"请求太频繁，请稍后再试");
    }
//    NSLog(@"ERROR: %@", error);
}
/**
 视频广告播放达到激励条件回调
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidRewardEffective:(MSRewardVideoAd *)rewardedVideoAd{
    NSLog(@"播放达到激励条件");
}

/**
 视频广告视频播放完成
 
 @param rewardedVideoAd MSRewardVideoAd 实例
 */
- (void)rewardVideoAdDidPlayFinish:(MSRewardVideoAd *)rewardedVideoAd{
    NSLog(@"视频播放结束");
}


- (void)dealloc
{
    
}

@end
