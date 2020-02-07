//
//  AlterBaseUrlView.m
//  Demo
//
//  Created by  xiaotu on 2019/11/26.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import "AlterBaseUrlView.h"
#import <MSAdSDK/MSAdSDK.h>

@implementation AlterBaseUrlView{
    UITextView* tv_;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UITextView* tv = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, frame.size.width-20, frame.size.height-70)];
        tv.backgroundColor = [UIColor lightGrayColor];
        tv.font = [UIFont systemFontOfSize:15];
        tv.text = [MSConfiger share].baseUrl;
        [self addSubview:tv];
        tv_ = tv;
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-60)*0.5, frame.size.height-50, 60, 40)];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:@"确定" forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
    }
    return self;
}

- (void)clickAction{
    [[MSConfiger share] update:tv_.text];
    UIAlertController* alter = [UIAlertController alertControllerWithTitle:nil message:@"修改成功" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction* su = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
    [alter addAction:su];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alter animated:YES completion:nil];
}


@end
