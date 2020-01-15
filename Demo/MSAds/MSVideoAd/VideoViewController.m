//
//  VideoViewController.m
//  Demo
//
//  Created by zzq on 2020/1/8.
//  Copyright © 2020 bwhx. All rights reserved.
//

#import "VideoViewController.h"
#import "MSVideoAd.h"
#import "IdProviderFactory.h"

@interface VideoViewController () <MSVideoAdDelegate>

@property (strong, nonatomic) MSVideoAd *videoAd;
@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *muteButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) NSTimer *countTimer;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = self.container.frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    self.container.frame = frame;
    self.pauseButton.hidden = YES;
    self.isPlaying = NO;

    [self loadAd];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

//- (void)handleDeviceOrientationChange {
//    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
//    NSInteger interfaceOrientation = UIDeviceOrientationPortrait;
//    if (orientation == UIDeviceOrientationLandscapeLeft) {
//        interfaceOrientation = UIInterfaceOrientationLandscapeRight;
//    } else if (orientation == UIDeviceOrientationLandscapeRight) {
//        interfaceOrientation = UIInterfaceOrientationLandscapeLeft;
//    } else if(orientation == UIDeviceOrientationPortrait) {
//        interfaceOrientation = UIInterfaceOrientationPortrait;
//    }
//    if (self.videoAd) {
//        [self.videoAd changeOrientation:interfaceOrientation];
//    }
//}

- (void)loadAd {
    self.videoAd = [[MSVideoAd alloc]init];
    self.videoAd.delegate = self;
    NSString *pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] video];
    [self.videoAd loadAdAndShow:self.container frame:self.container.frame pid:pid];
}

- (IBAction)playOrPause:(id)sender {
    if (self.isPlaying) {
        self.isPlaying = NO;
        [self.videoAd pause];
        [self.pauseButton setTitle:@"继续" forState:UIControlStateNormal];
    } else {
        self.isPlaying = YES;
        [self.videoAd play];
        [self.pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    }
}

- (IBAction)muteOrUnmute:(id)sender {
    self.videoAd.muted = !self.videoAd.muted;
    NSString *btnText = self.videoAd.isMuted ? @"恢复音量" : @"静音";
    [self.muteButton setTitle:btnText forState:UIControlStateNormal];
}

- (IBAction)showTime:(id)sender {
    NSInteger time = [self.videoAd currentTime];
    NSInteger duration = [self.videoAd duration];
    NSString *text = [NSString stringWithFormat:@"当前播放时间（秒）:%ld/%ld", time, duration];
    [self.timeButton setTitle:text forState:UIControlStateNormal];
    if (time >= duration) {
        [self destroyTimer];
    }
}

- (IBAction)updateSize:(id)sender {
    if (self.videoAd) {
        CGRect frame = self.videoAd.frame;
        frame.size.width = frame.size.width - 10;
        frame.size.height = frame.size.height - 10;
        if (frame.size.width < 100 || frame.size.height < 100) {
            return;
        }
        self.videoAd.frame = frame;
    }
}

- (void)countDown {
    [self showTime:nil];
}

- (void)msVideoLoad:(MSVideoAd *)videoAd {
    NSLog(@"demo 视频广告加载成功");
}

/**
 *  视频广告成功展示
 */
- (void)msVideoShow:(MSVideoAd *)videoAd {
    NSLog(@"demo 视频广告曝光");
    NSLog(@"demo 视频广告总时长（秒）：%ld", [self.videoAd duration]);
    self.pauseButton.hidden = NO;
    self.isPlaying = YES;
    [self.pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    self.countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidDisappear:animated];
    [self destroyTimer];
}

/**
 *  视频广告展示失败
 */
- (void)msVideoError:(MSVideoAd *)videoAd error:(NSError *)error {
    NSLog(@"demo 视频广告加载失败");
}

/**
 *  视频广告点击回调
 */
- (void)msVideoClick:(MSVideoAd *)splashAd {
    NSLog(@"demo 视频广告被点击");
}

/**
 *  视频广告将要关闭回调
 */
- (void)msVideoCompletion:(MSVideoAd *)splashAd {
    NSLog(@"demo 视频广告播放完成");
}

- (void)destroyTimer {
    if (self.countTimer) {
        [self.countTimer invalidate];
        self.countTimer = nil;
    }
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
    [self destroyTimer];
}

@end
