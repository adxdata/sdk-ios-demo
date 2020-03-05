//
//  NativeExpressAdViewController.m
//  GDTMobApp
//
//  Created by michaelxing on 2017/4/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "NativeExpressAdViewController.h"
#import <MSAdSDK/MSAdSDK.h>
#import "IdProviderFactory.h"
#import "FeedVideoView.h"

@interface NativeExpressAdViewController ()<MSNativeAdDelegate,UITableViewDelegate,UITableViewDataSource,MSNativeAdDelegate>

@property (nonatomic, strong) NSMutableArray *expressAdViews;
@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) MSNativeAd *nativeAd;

@property (weak, nonatomic) IBOutlet UILabel *widthLabel;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;
@property (weak, nonatomic) IBOutlet UISlider *adCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *adCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *placementIdTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) CGFloat height1;

@property (assign, nonatomic) CGFloat height2;

@property (assign, nonatomic) CGFloat height3;

@property (assign, nonatomic) CGFloat heightThreeImage;

@property (assign, nonatomic) CGFloat heightVideo;


@end

@implementation NativeExpressAdViewController

- (NSMutableArray *)expressAdViews{
    if (!_expressAdViews) {
        _expressAdViews = [NSMutableArray array];
    }
    return _expressAdViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.widthSlider.value = [UIScreen mainScreen].bounds.size.width;
    self.heightSlider.value = 50;
    self.adCountSlider.value = 3;
    
    self.widthLabel.text = [NSString stringWithFormat:@"宽：%@", @(self.widthSlider.value)];
    self.heightLabel.text = [NSString stringWithFormat:@"高：%@", @(self.heightSlider.value)];
    self.adCountLabel.text = [NSString stringWithFormat:@"count:%@", @(self.adCountSlider.value)];
    
    [self.widthSlider addTarget:self action:@selector(sliderPositionWChanged) forControlEvents:UIControlEventValueChanged];
    [self.heightSlider addTarget:self action:@selector(sliderPositionHChanged) forControlEvents:UIControlEventValueChanged];
    [self.adCountSlider addTarget:self action:@selector(sliderPositionCountChanged) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"nativeexpresscell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testdatacell"];
    
    NSString *placementId = self.placementIdTextField.text.length > 0? self.placementIdTextField.text: self.placementIdTextField.placeholder;
    MSWS(ws);
    self.nativeAd = [[MSNativeAd alloc]initWithCurController:self];
    self.nativeAd.delegate = self;
    [self refreshButton:nil];
    
}

- (IBAction)refreshButton:(id)sender {
//    NSString *pid = @"100424153";
    NSString *pid = nil;

    if (self.showType == MSLeftImage || self.showType == MSLeftImageNoButton) {
        pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] feedImageHorizon];
    } else if (self.showType == MSBottomImage) {
        pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] feedImageVertical];
    } else if (self.showType == MSThreeImage) {
        pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] feedThreeImgs];
    } else if (self.showType == MSVideo) {
        pid = [[[IdProviderFactory sharedIdProviderFactory] getDefaultProvider] video];
    }
    self.nativeAd.showVideoDetail = YES;
    /*
     * 拉取广告,传入参数为拉取个数。
     * 发起拉取广告请求,在获得广告数据后回调delegate
     */
    [self.nativeAd loadAd:10 pid:pid]; //这里以一次拉取一条原生广告为例
}


- (void)sliderPositionWChanged {
    self.widthLabel.text = [NSString stringWithFormat:@"宽：%.0f",self.widthSlider.value];
}

- (void)sliderPositionHChanged {
    self.heightLabel.text = [NSString stringWithFormat:@"高：%.0f",self.heightSlider.value];
}

- (void)sliderPositionCountChanged {
    self.adCountLabel.text = [NSString stringWithFormat:@"count:%d",(int)self.adCountSlider.value];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.expressAdViews[indexPath.row] isKindOfClass:[NSString class]]) {
        return 70;
    }
    if (self.showType == MSLeftImage) {
        return self.height1;
    } else if (self.showType == MSLeftImageNoButton){
        return self.height2;
    } else if (self.showType == MSBottomImage){
        return self.height3;
    } else if (self.showType == MSThreeImage) {
        return self.heightThreeImage;
    } else if (self.showType == MSVideo) {
        return self.heightVideo;
    }
    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.expressAdViews.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.expressAdViews[indexPath.row] isKindOfClass:[NSString class]]) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"testdatacell"
                                                                 forIndexPath:indexPath];
        NSString *data = self.expressAdViews[indexPath.row];
        [cell.textLabel setText:data];
        return cell;
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"nativeexpresscell"
                                                             forIndexPath:indexPath];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                      reuseIdentifier: @"nativeexpresscell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    MSFeedAdData *data = self.expressAdViews[indexPath.row];
    if (data.adModel.creative_type == MSCreativeTypeVideo) {
        FeedVideoView *ativeAdView = [[FeedVideoView alloc]initWithWidth:self.view.frame.size.width adModel:data.adModel];
        [cell addSubview:ativeAdView];
        //要加载的数据
        MSFeedVideoView *mediaView = [data registerMediaView:[ativeAdView getMediaViewContainer] clickView:ativeAdView vc:self];
        ativeAdView.mediaView = mediaView;
        mediaView.delegate = ativeAdView;
//        [self.nativeAd attachAd:model toView:ativeAdView];
    } else {
        MSNativeAdView *ativeAdView = [[MSNativeAdView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) adModel:data.adModel];
        
        ativeAdView.nativeAdViewShowType = self.showType;
        
        [cell addSubview:ativeAdView];
        //要加载的数据
        [data attachAd:ativeAdView];
    }
    cell.userInteractionEnabled = YES;
    cell.accessibilityIdentifier = @"nativeTemp_ad";
    return cell;
}

/**
 *  原生广告加载广告数据成功回调，返回为MSFeedAdData对象的数组
 */
- (void)msNativeLoaded:(NSArray *)nativeAdDataArray{
    NSLog(@"demo 加载成功");
    MSWS(ws);
    if (nativeAdDataArray.count > 0) {
        [ws.tableView beginUpdates];
        NSInteger count = ws.expressAdViews.count;

        MSFeedAdData *data = nativeAdDataArray[0];
        if (data.adModel.creative_type != MSCreativeTypeVideo) {
            CGFloat tmp = [MSNativeAdView heightCellForRow:data.adModel nativeAdViewShowType:ws.showType];
            if (ws.showType == MSLeftImage) {
                ws.height1 = tmp;
            } else if (ws.showType == MSLeftImageNoButton) {
                ws.height2 = tmp;
            } else if (ws.showType == MSBottomImage) {
                ws.height3 = tmp;
            } else if (ws.showType == MSThreeImage) {
                ws.heightThreeImage = tmp;
            }
        } else {
            ws.heightVideo = [FeedVideoView heightCellForRow:data.adModel width:self.view.frame.size.width];
        }

        NSMutableArray<NSIndexPath *> *paths = [NSMutableArray new];
        [ws.expressAdViews addObjectsFromArray:nativeAdDataArray];

        for (NSInteger i = 0; i < nativeAdDataArray.count; i++) {
            [paths addObject:[NSIndexPath indexPathForItem:(count + i) inSection:0]];
        }
        count += nativeAdDataArray.count;

        for (NSInteger i = 0; i < 10; i++) {
//            [ws.expressAdViews addObject:[[NSString alloc] initWithFormat:@"测试数据 %d" arguments:ws.expressAdViews.count]];
            [ws.expressAdViews addObject:@"测试数据"];
            [paths addObject:[NSIndexPath indexPathForItem:(count + i) inSection:0]];
        }
        [ws.tableView insertRowsAtIndexPaths:paths withRowAnimation:false];

        [ws.tableView endUpdates];
    }
}

/**
 *  原生广告加载广告数据失败回调
 */
- (void)msNativeError:(NSError *)error{
    NSLog(@"demo 加载失败");
}

/**
 * 原生广告曝光
 */
- (void)msNativeShow:(MSFeedAdData *)data {
    NSLog(@"demo 广告曝光");
}

- (void)dealloc {
    
}
@end
