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
    return @"100424301";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"100424300";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"100424299";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"100424302";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"100424297";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"100424296";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"100424298";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"100424303";
}
/** 纯视频 */
-(NSString *) video {
    return @"100424295";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"100424294";
}
/** 图片 */
-(NSString *) image {
    return @"100424293";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"100424292";
}
/** 开屏 */
-(NSString *) splash {
    return @"100424291";
}
/** banner */
-(NSString *) banner {
    return @"73646b0399631991";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"百度";
}

@end
