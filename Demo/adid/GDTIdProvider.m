//
//  GDTIdProvider.m
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDTIdProvider.h"

@interface GDTIdProvider ()

@end

@implementation GDTIdProvider

/** 竖版激励视频 */
-(NSString *) rewardPortrait {
    return @"100424288";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"100424287";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"100424286";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"100424289";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"100424284";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"100424283";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"100424285";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"100424282";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"100424281";
}
/** 图片 */
-(NSString *) image {
    return @"100424280";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"100424279";
}
/** 开屏 */
-(NSString *) splash {
    return @"100424278";
}
/** banner */
-(NSString *) banner {
    return @"100424277";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"广点通";
}

@end
