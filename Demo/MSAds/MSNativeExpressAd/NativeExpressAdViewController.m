//
//  NativeExpressAdViewController.m
//  GDTMobApp
//
//  Created by michaelxing on 2017/4/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "NativeExpressAdViewController.h"
#import "MSNativeAdView.h"
#import "MSNativeAd.h"

@interface NativeExpressAdViewController ()<MSNativeAdDelegate,UITableViewDelegate,UITableViewDataSource,MSNativeAdDelegate>

@property (nonatomic, strong) NSMutableArray *expressAdViews;

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
    
    NSString *placementId = self.placementIdTextField.text.length > 0? self.placementIdTextField.text: self.placementIdTextField.placeholder;
    MSWS(ws);
    self.nativeAd = [[MSNativeAd alloc]initWithCurController:self];
    self.nativeAd.delegate = self;
    [self refreshButton:nil];
    
}

- (IBAction)refreshButton:(id)sender {
    
    
    /*
     * 拉取广告,传入参数为拉取个数。
     * 发起拉取广告请求,在获得广告数据后回调delegate
     */
    [self.nativeAd loadAd:10]; //这里以一次拉取一条原生广告为例
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.showType == 0) {
        return self.height1;
    }
    else if (self.showType == 1){
        return self.height2;
    }
    else if (self.showType == 2){
        return self.height3;
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
    MSAdModel *model = self.expressAdViews[indexPath.row];
    MSNativeAdView *ativeAdView = [[MSNativeAdView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) adModel:model];
    if (self.showType == 0) {
        ativeAdView.nativeAdViewShowType = MSLeftImage;
    }
    else if (self.showType == 1){
        ativeAdView.nativeAdViewShowType = MSLeftImageNoButton;
    }
    else if (self.showType == 2){
        ativeAdView.nativeAdViewShowType = MSBottomImage;
    }
    [cell addSubview:ativeAdView];
    cell.userInteractionEnabled = YES;
    //要加载的数据
    [self.nativeAd attachAd:model toView:ativeAdView indexPath:indexPath];
    cell.accessibilityIdentifier = @"nativeTemp_ad";
    return cell;
}

/**
 *  原生广告加载广告数据成功回调，返回为GDTNativeAdData对象的数组
 */
- (void)nativeAdSuccessToLoad:(NSArray *)nativeAdDataArray{
    MSWS(ws);
    if (nativeAdDataArray.count>0) {
        MSAdModel *adModel = nativeAdDataArray[0];
        if (ws.showType == 0) {
            ws.height1 = [MSNativeAdView heightCellForRow:adModel nativeAdViewShowType:MSLeftImage];
        }
        else if (ws.showType == 1){
            ws.height2 = [MSNativeAdView heightCellForRow:adModel nativeAdViewShowType:MSLeftImageNoButton];
        }
        else if (ws.showType == 2){
            ws.height3 = [MSNativeAdView heightCellForRow:adModel nativeAdViewShowType:MSBottomImage];
        }
        [ws.expressAdViews addObjectsFromArray:nativeAdDataArray];
        //主线程刷新页面
        dispatch_async(dispatch_get_main_queue(), ^{
            [ws.tableView reloadData];
        });
    }
}

/**
 *  原生广告加载广告数据失败回调
 */
- (void)nativeAdFailToLoad:(NSError *)error{
    
}

/**
 *  原生广告点击之后将要展示内嵌浏览器或应用内AppStore回调
 */
- (void)nativeAdWillPresentScreen{
    
}


/**
 * 原生广告点击以后，内置AppStore或是内置浏览器被关闭时回调
 */
- (void)nativeAdClosed{
    
}

- (void)dealloc
{
    
}
@end
