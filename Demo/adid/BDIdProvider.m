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
    return @"73646b0799031991";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"73646b0799031991";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"73646b0102031991";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"73646b0104031991";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    return @"73646b0101031991";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"73646b0103031991";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"73646b0103031991";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"73646b0699031991";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"73646b0602031991";
}
/** 图片 */
-(NSString *) image {
    return @"100424253";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"73646b0599031991";
}
/** 开屏 */
-(NSString *) splash {
    return @"73646b0499031991";
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
