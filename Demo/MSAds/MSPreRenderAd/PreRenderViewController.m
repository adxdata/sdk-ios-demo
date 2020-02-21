//
//  PreRenderViewController.m
//  Demo
//
//  Created by zzq on 2020/2/19.
//  Copyright © 2020 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PreRenderViewController.h"
#import <MSAdSDK/MSAdSDK.h>
#import "IdProviderFactory.h"

@interface PreRenderViewController () <UITableViewDelegate, UITableViewDataSource, MSPrerenderAdDelegate>

@property (strong, nonatomic) NSMutableArray<__kindof UIView *> *expressAdViews;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MSPrerenderAd *prerenderAd;

@end

@implementation PreRenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.expressAdViews = [NSMutableArray new];
    [self setupViews];
    
    [self loadData];
}

- (void)setupViews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"PreRenderCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)loadData {
    self.prerenderAd = [[MSPrerenderAd alloc] initWithCurController:self];
    self.prerenderAd.delegate = self;
    [self.prerenderAd loadAd:@"123456"];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = [self.expressAdViews objectAtIndex:indexPath.row];
    return view.bounds.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.expressAdViews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PreRenderCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    // 重用BUNativeExpressAdView，先把之前的广告视图取下来，再添加上当前视图
    UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
    if ([subView superview]) {
        [subView removeFromSuperview];
    }

    UIView *view = [self.expressAdViews objectAtIndex:indexPath.row];
    view.tag = 1000;
    [cell.contentView addSubview:view];
    return cell;
}

/**
 *  请求广告条数据成功后调用
 *  详解:当接收服务器返回的广告数据成功后调用该函数
 */
- (void)msPrerenderLoaded:(MSPrerenderAd *)prerenderAd adViewArray:(NSArray *)adViewArray {
//    [self.expressAdViews removeAllObjects];//【重要】不能保存太多view，需要在合适的时机手动释放不用的，否则内存会过大
    if (adViewArray.count) {
        [self.expressAdViews addObjectsFromArray:adViewArray];
    }
    [self.tableView reloadData];
    NSLog(@"demo 模板信息流广告加载成功");
}

/**
 *  请求广告条数据失败后调用
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)msPrerenderError:(MSPrerenderAd *)prerenderAd error:(NSError *)error {
    NSLog(@"demo 模板信息流广告加载失败");
}

/**
 *  广告视图渲染成功
 *  详解:广告视图渲染成功后调用该函数
 */
- (void)msPrerenderRenderSuccess:(UIView *)adView {
    [self.tableView reloadData];
    NSLog(@"demo 模板信息流广告渲染成功");
}

/**
 *  广告视图渲染失败
 *  详解:广告视图渲染失败后调用该函数
 */
- (void)msPrerenderRenderError:(UIView *)adView error:(NSError *)error {
    NSLog(@"demo 模板信息流广告渲染失败");
}

/**
 *  prerender广告曝光
 */
- (void)msPrerenderShow:(UIView *)adView {
    NSLog(@"demo 模板信息流广告曝光");
}

/**
 *  prerender点击回调
 */
- (void)msPrerenderClicked:(UIView *)adView {
    NSLog(@"demo 模板信息流广告被点击");
}

/**
 *  prerender条被用户关闭时调用
 *  详解:用户有可能点击关闭按钮从而把广告条关闭
 */
- (void)msPrerenderClosed:(UIView *)adView {
    NSLog(@"demo 模板信息流广告被关闭");
    //【重要】需要在点击叉以后 在这个回调中移除视图，否则，会出现用户点击叉无效的情况
    [self.expressAdViews removeObject:adView];
    
    NSUInteger index = [self.expressAdViews indexOfObject:adView];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
