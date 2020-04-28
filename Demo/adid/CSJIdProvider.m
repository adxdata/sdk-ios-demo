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
    return @"73646b0799011991";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"73646b0799011991";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"73646b0102011991";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"73646b0104011991";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"73646b0101011991";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"73646b0103011991";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"73646b0103011991";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"73646b0699011991";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"73646b0602011991";
}
/** 图片 */
-(NSString *) image {
    return @"100424253";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"73646b0599011991";
}
/** 开屏 */
-(NSString *) splash {
    return @"73646b0499011991";
}
/** banner */
-(NSString *) banner {
    return @"73646b0399011991";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"穿山甲";
}

@end
