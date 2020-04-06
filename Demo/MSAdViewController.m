//
//  GDTAdViewController.m
//  GDTMobApp
//
//  Created by royqpwang on 2019/3/26.
//  Copyright © 2019 Tencent. All rights reserved.
//

#import "MSAdViewController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <objc/runtime.h>
#import "AlterBaseUrlView.h"
#import <CoreLocation/CoreLocation.h>
#import <MSAdSDK/MSAdSDK.h>
#import "IdProviderFactory.h"

#import <BUAdSDK/BUAdSDKManager.h>
#import <BaiduMobAdSDK/BaiduMobAdCommonConfig.h>
#import "GDTSDKConfig.h"

@interface MSAdViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AlterBaseUrlView* header;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;

@end

@implementation MSAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupPlatformButtons];
    [self.view addSubview:self.tableView];

    _locationManager = [[CLLocationManager alloc] init];
    CLAuthorizationStatus CLstatus = [CLLocationManager authorizationStatus];

    if (CLstatus == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
    }
}

- (void)setupPlatformButtons {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, msScreenWidth, 60)];
    view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:view];
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, 59, msScreenWidth, 1)];
    border.backgroundColor = MSUIColorFromRGB(0xE0E0E0);
    [self.view addSubview:border];

    self.buttons = [[NSMutableArray alloc] init];
    CGFloat btnMargin = 10;
    CGFloat btnWidth = (msScreenWidth - btnMargin * 5) / 4;
    CGFloat btnHeight = 30;
    CGFloat btnY = 15;

    NSString *msStr = [NSString stringWithFormat:@"美数%@", [MSAdSDK getVersionName]];
    NSString *csjStr = [NSString stringWithFormat:@"穿山甲%@", [BUAdSDKManager SDKVersion]];
    NSString *gdtStr = [NSString stringWithFormat:@"广点通%@", [GDTSDKConfig sdkVersion]];
    NSString *bdStr = [NSString stringWithFormat:@"百度%@", SDK_VERSION_IN_MSSP];

    [self.buttons addObject:[self createButton:msStr rect:CGRectMake(btnMargin, btnY, btnWidth, btnHeight)]];
    [self.buttons addObject:[self createButton:csjStr rect:CGRectMake(btnMargin + 1 * (btnMargin + btnWidth), btnY, btnWidth, btnHeight)]];
    [self.buttons addObject:[self createButton:gdtStr rect:CGRectMake(btnMargin + 2 * (btnMargin + btnWidth), btnY, btnWidth, btnHeight)]];
    [self.buttons addObject:[self createButton:bdStr rect:CGRectMake(btnMargin + 3 * (btnMargin + btnWidth), btnY, btnWidth, btnHeight)]];

    for (UIButton *btn in self.buttons) {
        [btn addTarget:self action:@selector(platformSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self platformSelected:self.buttons[0]];
}

- (void)platformSelected:(UIButton *)btn {
    for (UIButton *tmp in self.buttons) {
        if (tmp == btn) {
            tmp.selected = YES;
            tmp.backgroundColor = MSUIColorFromRGB(0x46A3FF);
            if ([btn.currentTitle containsString:@"美数"]) {
                [[IdProviderFactory sharedIdProviderFactory] setDefaultPlatform:PlatformNameMS];
            } else if ([btn.currentTitle containsString:@"穿山甲"]) {
                [[IdProviderFactory sharedIdProviderFactory] setDefaultPlatform:PlatformNameCSJ];
            } else if ([btn.currentTitle containsString:@"广点通"]) {
                [[IdProviderFactory sharedIdProviderFactory] setDefaultPlatform:PlatformNameGDT];
            } else if ([btn.currentTitle containsString:@"百度"]) {
                [[IdProviderFactory sharedIdProviderFactory] setDefaultPlatform:PlatformNameBD];
            }
        } else {
            tmp.selected = NO;
            tmp.backgroundColor = UIColor.whiteColor;
        }
    }
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text = self.demoArray[indexPath.row][0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id item = self.demoArray[indexPath.row][1];
    if ([item isKindOfClass:[NSString class]]) {
        UIViewController *vc = [[NSClassFromString(item) alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        NSString *idfaCopyedMsg = [NSString stringWithFormat:@"%@\n 已经复制到你的粘贴板",idfa];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:idfaCopyedMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        // sync idfa to pasteboard
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = idfa;
        [alert show];
    }
}

#pragma mark - property getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, msScreenWidth, msScreenHeight - 60)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableHeaderView = self.header;
    }
    return _tableView;
}

- (AlterBaseUrlView*)header{
    if (!_header) {
        _header = [[AlterBaseUrlView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 170)];
    }
    return _header;
}

- (UIButton *)createButton:(NSString *)text rect:(CGRect)rect {
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [self.view addSubview:button];
    button.layer.cornerRadius = 5;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    button.layer.borderColor = [MSUIColorFromRGB(0xADADAD) CGColor];
    button.layer.borderWidth = 1;
    return button;
}

@end
