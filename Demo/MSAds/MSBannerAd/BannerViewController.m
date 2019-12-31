//
//  BannerViewController.m
//  GDTTestDemo
//
//  Created by 高超 on 13-11-1.
//  Copyright (c) 2013年 高超. All rights reserved.
//

#import "BannerViewController.h"
#import "MSBannerView.h"

@interface BannerViewController() <MSBannerViewDelegate>

@property (nonatomic, strong) MSBannerView *bannerView;

@property (weak, nonatomic) IBOutlet UITextField *placementIdText;
@property (weak, nonatomic) IBOutlet UITextField *refreshIntervalText;
@property (weak, nonatomic) IBOutlet UISwitch *gpsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *closeBtnSwitch;

@end

@implementation BannerViewController

#pragma mark - lifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self clickLoadAd:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - property getter
- (MSBannerView *)bannerView
{
    if (!_bannerView) {
        CGRect rect = {CGPointZero, GDTMOB_AD_SUGGEST_SIZE_320x50};
//        __weak __typeof__(self) weakSelf = self;
        _bannerView = [[MSBannerView alloc] initWithFrame:rect curController:self];
//        _bannerView.currentViewController = self;
        _bannerView.delegate = self;
    }
    return _bannerView;
}

#pragma mark - event repsonse
- (IBAction)clickLoadAd:(id)sender {
    [self clickRemoveAd:nil];
    [self.view addSubview:self.bannerView];
    [_bannerView loadAdAndShow:self];
}

- (IBAction)clickRemoveAd:(id)sender {
    [_bannerView removeFromSuperview];
    _bannerView = nil;
}


#pragma mark - GDTMobBannerViewDelegate
/**
 *  请求广告条数据成功后调用
 *  详解:当接收服务器返回的广告数据成功后调用该函数
 */
- (void)bannerViewDidReceived{
    
}

/**
 *  请求广告条数据失败后调用
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)bannerViewFailToReceived:(NSError *)error{
    
}


/**
 *  banner条点击回调
 */
- (void)bannerViewClicked{
    
}

/**
 *  banner条被用户关闭时调用
 *  详解:当打开showCloseBtn开关时，用户有可能点击关闭按钮从而把广告条关闭
 */
- (void)bannerViewWillClose{
    
}

/**
 *  banner广告点击以后弹出全屏广告页完毕
 */
- (void)bannerViewDidPresentFullScreenModal{
    
}

/**
 *  全屏广告页已经被关闭
 */
- (void)bannerViewDidDismissFullScreenModal{
    
}

- (void)dealloc
{
    
}
@end
