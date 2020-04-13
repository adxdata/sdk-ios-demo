//
//  SplashViewContronller.m
//  GDTMobApp
//
//  Created by GaoChao on 15/8/21.
//  Copyright © 2015年 Tencent. All rights reserved.
//

#import "SplashViewController.h"
#import <MSAdSDK/MSAdSDK.h>
#import "IdProviderFactory.h"

@interface SplashViewController () <MSSplashAdDelegate>

@property (strong, nonatomic) MSSplashAd *splash;
@property (nonatomic, strong) UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITextField *placementIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *logoHeightTextField;
@property (weak, nonatomic) IBOutlet UILabel *logoDescLabel;

@end

@implementation SplashViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.logoHeightTextField.text = [NSString stringWithFormat:@"%@", @([[UIScreen mainScreen] bounds].size.height * 0.25)] ;
    self.logoDescLabel.text = [NSString stringWithFormat:@"底部logo高度上限：\n %@(屏幕高度) * 25%% = %@", @([[UIScreen mainScreen] bounds].size.height), @([[UIScreen mainScreen] bounds].size.height * 0.25)];
    [self loadAd:nil];
}
- (IBAction)clickLoad:(id)sender {
    [self loadAd:nil];
}

- (IBAction)clickLoadHalf:(id)sender {
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, msScreenWidth, msScreenHeight * 0.25)];
    bottomView.backgroundColor = UIColor.whiteColor;

    UIImage *image = [UIImage imageNamed:@"logo@3x.png"];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:image];
//    logoView.contentMode =  UIViewContentModeCenter;
    CGFloat width = 114;
    CGFloat height = 40;
    logoView.frame = CGRectMake((msScreenWidth - width) / 2, (msScreenHeight * 0.25 - height) / 2, width, height) ;
    [bottomView addSubview:logoView];
    [self loadAd:bottomView];
}

- (void)loadAd:(UIView *)bottomView {
    MSSplashAd *splash = [[MSSplashAd alloc]init];
    splash.delegate = self;
    if (bottomView) {
        splash.bottomView = bottomView;
    }
    self.splash = splash;
//    NSString *pid = @"100424147";
    NSString *pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] splash];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [splash loadAdAndShowInWindow:window pid:pid];
}


- (void)msSplashLoaded:(MSSplashAd *)splashAd {
    NSLog(@"DEMO ADEVENT 广告加载成功");
}

/**
 *  开屏广告成功展示
 */
- (void)msSplashShow:(MSSplashAd *)splashAd{
    NSLog(@"DEMO ADEVENT 广告曝光");
}

/**
 *  开屏广告展示失败
 */
- (void)msSplashError:(MSSplashAd *)splashAd withError:(NSError *)error{
    NSLog(@"DEMO ADEVENT 广告加载失败");
}


/**
 *  开屏广告点击回调
 */
- (void)msSplashClicked:(MSSplashAd *)splashAd{
    NSLog(@"DEMO ADEVENT 广告点击");
}

/**
 *  开屏广告关闭回调
 */
- (void)msSplashClosed:(MSSplashAd *)splashAd{
    self.splash = nil;
    NSLog(@"DEMO ADEVENT 广告关闭");
}

/**
 * 广告被跳过时调用
 */
- (void)msSplashSkip:(MSSplashAd *)splashAd {
    NSLog(@"DEMO ADEVENT 广告跳过");
}

- (void)dealloc {
    
}

@end
