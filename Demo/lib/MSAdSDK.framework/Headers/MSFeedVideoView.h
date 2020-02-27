//
//  MSFeedVideoView.h
//  MSAdSDK
//
//  Created by zzq on 2020/2/27.
//  Copyright © 2020 yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSAdModel.h"
#import "MSSDKDefines.h"

@interface MSFeedVideoView : UIView

/**
 *  构造方法
 *  详解：frame - banner 展示的位置和大小
 */
- (instancetype)initWithFrame:(CGRect)frame adModel:(MSAdModel*)adModel;

+ (CGFloat)heightCellForRow:(MSAdModel*)adModel width:(CGFloat)width ;

@end
