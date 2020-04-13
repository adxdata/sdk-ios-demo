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

@interface MSAdViewController () <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AlterBaseUrlView* header;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation MSAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;

    _locationManager = [[CLLocationManager alloc] init];
    CLAuthorizationStatus CLstatus = [CLLocationManager authorizationStatus];

    if (CLstatus == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
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
        _tableView = [[UITableView alloc] init];
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

@end
