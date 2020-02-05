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
#import "Masonry.h"

@interface VideoViewController () <MSVideoAdDelegate>

@property (strong, nonatomic) MSVideoAd *videoAd;
@property (strong, nonatomic) UIView *container;
@property (strong, nonatomic) UIButton *pauseButton;
@property (strong, nonatomic) UIButton *muteButton;
@property (strong, nonatomic) UIButton *sizeButton;
@property (strong, nonatomic) UIButton *timeButton;

@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) NSTimer *countTimer;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isPlaying = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initContainer];
    [self initPauseButton];
    [self initMuteButton];
    [self initSizeButton];
    [self initTimeButton];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.videoAd) {
        [self loadAd];
    }
}

- (void)handleDeviceOrientationChange {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        CGRect hFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.videoAd.frame = hFrame;
        self.container.frame = hFrame;
    } else {
        CGRect vFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
        self.videoAd.frame = vFrame;
        self.container.frame = vFrame;
    }

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
}

- (void)initContainer {
    self.container = [[UIView alloc] init];
    [self.view addSubview:self.container];
    [self handleDeviceOrientationChange];
}

- (void)initPauseButton {
    self.pauseButton = [[UIButton alloc] init];
    [self.pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    [self.view addSubview:self.pauseButton];
    [self.pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.pauseButton.hidden = YES;
    [self.pauseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.container.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    [self.pauseButton addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initMuteButton {
    self.muteButton = [[UIButton alloc] init];
    [self.muteButton setTitle:@"静音" forState:UIControlStateNormal];
    [self.muteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.muteButton];
    [self.muteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pauseButton.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    [self.muteButton addTarget:self action:@selector(muteOrUnmute:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initSizeButton {
    self.sizeButton = [[UIButton alloc] init];
    [self.sizeButton setTitle:@"修改大小" forState:UIControlStateNormal];
    [self.sizeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.sizeButton];
    [self.sizeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.muteButton.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    [self.sizeButton addTarget:self action:@selector(updateSize:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initTimeButton {
    self.timeButton = [[UIButton alloc] init];
    [self.view addSubview:self.timeButton];
    [self.timeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sizeButton.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    [self.timeButton addTarget:self action:@selector(showTime:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadAd {
    self.videoAd = [[MSVideoAd alloc]init];
    self.videoAd.viewController = self;
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

    self.videoAd.delegate = nil;
    self.videoAd = nil;
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
//    [self.videoAd destroy];
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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
