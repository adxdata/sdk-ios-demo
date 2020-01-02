//
//  SplashViewContronller.m
//  GDTMobApp
//
//  Created by GaoChao on 15/8/21.
//  Copyright © 2015年 Tencent. All rights reserved.
//

#import "SplashViewController.h"
#import "MSSplashAd.h"
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
    [self loadAd];
}
- (IBAction)clickLoad:(id)sender {
    [self loadAd];
}

- (void)loadAd
{
    MSSplashAd *splash = [[MSSplashAd alloc]init];
    splash.delegate = self;
    self.splash = splash;
//    NSString *pid = @"100424147";
    NSString *pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] splash];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [splash loadAdAndShowInWindow:window pid:pid];
}

/**
 *  开屏广告成功展示
 */
- (void)splashAdSuccessPresentScreen:(MSSplashAd *)splashAd{
    
}

/**
 *  开屏广告展示失败
 */
- (void)splashAdFailToPresent:(MSSplashAd *)splashAd withError:(NSError *)error{
    
}


/**
 *  开屏广告点击回调
 */
- (void)splashAdClicked:(MSSplashAd *)splashAd{
    
}

/**
 *  开屏广告将要关闭回调
 */
- (void)splashAdWillClosed:(MSSplashAd *)splashAd{
    
}

/**
 *  开屏广告关闭回调
 */
- (void)splashAdClosed:(MSSplashAd *)splashAd{
    self.splash = nil;
}


/**
 *  点击以后全屏广告页已经关闭
 */
- (void)splashAdDidDismissFullScreenModal:(MSSplashAd *)splashAd{
    
}

- (void)dealloc
{
    
}

@end
