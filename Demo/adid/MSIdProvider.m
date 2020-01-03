//
//  MSIdProvider.m
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSIdProvider.h"

@interface MSIdProvider ()

@end

@implementation MSIdProvider

/** 竖版激励视频 */
-(NSString *) rewardPortrait {
    return @"100424261";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"100424260";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"100424259";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"100424262";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"100424257";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"100424256";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"100424258";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"100424255";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"100424254";
}
/** 图片 */
-(NSString *) image {
    return @"100424253";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"100424252";
}
/** 开屏 */
-(NSString *) splash {
    return @"100424251";
}
/** banner */
-(NSString *) banner {
    return @"100424250";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"美数";
}

@end
