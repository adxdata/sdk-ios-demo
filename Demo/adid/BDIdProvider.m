//
//  BDIdProvider.m
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDIdProvider.h"

@interface BDIdProvider ()

@end

@implementation BDIdProvider

/** 竖版激励视频 */
-(NSString *) rewardPortrait {
    return @"100424128";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"100424127";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"100424126";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"100424129";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"100424124";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"100424123";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"100424125";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"100424122";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"100424121";
}
/** 图片 */
-(NSString *) image {
    return @"100424120";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"100424119";
}
/** 开屏 */
-(NSString *) splash {
    return @"100424118";
}
/** banner */
-(NSString *) banner {
    return @"100424117";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"美数";
}

@end
