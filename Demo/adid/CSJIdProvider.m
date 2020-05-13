//
//  CSJIdProvider.m
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSJIdProvider.h"

@interface CSJIdProvider ()

@end

@implementation CSJIdProvider

/** 竖版激励视频 */
-(NSString *) rewardPortrait {
    return @"100424275";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"100424274";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"100424273";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"100424276";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"100424271";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"100424270";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"100424272";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"73646b0299831991";
}
/** 纯视频 */
-(NSString *) video {
    return @"100424269";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"100424268";
}
/** 图片 */
-(NSString *) image {
    return @"100424267";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"100424266";
}
/** 开屏 */
-(NSString *) splash {
    return @"100424265";
}
/** banner */
-(NSString *) banner {
    return @"100424264";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"穿山甲";
}
@end
