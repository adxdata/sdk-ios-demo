//
//  MSNativeAdController.m
//  Demo
//
//  Created by bwhx on 2019/11/26.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import "MSNativeAdController.h"
#import "NativeExpressAdViewController.h"

@interface MSNativeAdController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *demoArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MSNativeAdController

- (NSMutableArray *)demoArray{
    if (!_demoArray) {
        _demoArray = [NSMutableArray arrayWithObjects:@"左图右文字带按钮", @"左图右文字", @"上文字下图", @"三图", nil];
    }
    return _demoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
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
    cell.textLabel.text = self.demoArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NativeExpressAdViewController *vc = [[NativeExpressAdViewController alloc]init];
    vc.showType = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark - property getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
