//
//  FeedVideoView.m
//  Demo
//
//  Created by zzq on 2020/2/28.
//  Copyright © 2020 bwhx. All rights reserved.
//


#import "FeedVideoView.h"
#import <StoreKit/StoreKit.h>
#import <MSAdSDK/MSAdSDK.h>

@interface FeedVideoView()
@property (nonatomic, strong) UILabel *titleLabel;//标题
@property (nonatomic, strong) UILabel *contentLabel;//描述
@property (strong, nonatomic)MSAdModel *adModel;
//@property (strong, nonatomic)UIView *endView;
@property (strong, nonatomic)MSFeedVideoView *videoView;
@property (strong, nonatomic)UIView *mediaViewContainer;

@end

@implementation FeedVideoView
- (instancetype)initWithWidth:(CGFloat)width adModel:(id)adModel {
    if (self = [super initWithFrame:CGRectMake(0, 0, width, 100)]) {
        self.adModel = adModel;
        [self custemView];
    }
    return self;
}


- (void)custemView{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    self.titleLabel = [UILabel new];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.textColor = MSUIColorFromRGB(0x666666);
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
    
    [self customAdModel:self.adModel];
}

- (void)customAdModel:(MSAdModel *)adModel{
    self.titleLabel.text = adModel.title;
    self.contentLabel.text = adModel.content;
    
    CGFloat textMargin = 20;
    CGFloat textWidth = self.frame.size.width - textMargin * 2;
    CGSize titleSize =  [MSCommCore getTextSize:adModel.title fontSize:17 maxChatWidth:textWidth];
    CGSize contentSize =  [MSCommCore getTextSize:adModel.content fontSize:16 maxChatWidth:textWidth];
    self.titleLabel.frame = CGRectMake(textMargin, 10, textWidth, titleSize.height);
    self.contentLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 5, CGRectGetWidth(self.titleLabel.frame), contentSize.height);

    CGRect frame = CGRectMake(20, CGRectGetMaxY(self.contentLabel.frame) + 5, CGRectGetWidth(self.titleLabel.frame), 190);
    self.mediaViewContainer = [[UIView alloc] initWithFrame:frame];
    [self addSubview:self.mediaViewContainer];
    self.frame = CGRectMake(0, 0, self.frame.size.width, [FeedVideoView heightCellForRow:self.adModel width:self.frame.size.width]);
}

- (UIView *)getMediaViewContainer {
    return self.mediaViewContainer;
}

+ (CGFloat)heightCellForRow:(MSAdModel*)adModel width:(CGFloat)width {
    
    CGFloat textMargin = 20;
    CGFloat textWidth = width - textMargin * 2;
    CGSize titleSize =  [MSCommCore getTextSize:adModel.title fontSize:17 maxChatWidth:textWidth];
    CGSize contentSize =  [MSCommCore getTextSize:adModel.content fontSize:16 maxChatWidth:textWidth];
    
    return titleSize.height + contentSize.height + 190 + 25;
}

- (void)msFeedVideoFinish {
    NSLog(@"DEMO ADEVENT 信息流视频播放完成");
}

- (void)msFeedVideoStart {
    NSLog(@"DEMO ADEVENT 信息流视频播放开始");
}

- (void)msFeedVideoPause {
    NSLog(@"DEMO ADEVENT 信息流视频播放暂停");
}

- (void)msFeedVideoError:(NSError *)error {
    NSLog(@"DEMO ADEVENT 信息流视频播放失败");
}

@end
