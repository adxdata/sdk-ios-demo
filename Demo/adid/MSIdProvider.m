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
    return @"73646b0799001991";
}
/** 横版激励视频 */
-(NSString *) rewardLandscape {
    return @"73646b0799001991";
}
/** 信息流视频 */
-(NSString *) feedVideo {
    return @"73646b0102001991";
}
/** 信息流三图一文 */
-(NSString *) feedThreeImgs {
    return @"73646b0104001991";
}
/** 信息流上图下文 */
-(NSString *) feedImageVertical {
    //return @"100424257";
    return @"73646b0101001991";
}
/** 信息流左图右文 */
-(NSString *) feedImageHorizon {
    return @"73646b0103001991";
}
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc {
    return @"73646b0103001991";
}
/** 信息流预渲染 */
-(NSString *) feedPreRender {
    return @"";
}
/** 纯视频 */
-(NSString *) video {
    return @"73646b0699001991";
//    return @"1006736";
}
/** 视频暂停贴片 */
-(NSString *) videoImg {
    return @"73646b0602001991";
}
/** 图片 */
-(NSString *) image {
    return @"100424253";
}
/** 插屏 */
-(NSString *) insertScreen {
    return @"73646b0599001991";
}
/** 开屏 */
-(NSString *) splash {
    return @"73646b0499001991";
}
/** banner */
-(NSString *) banner {
    return @"73646b0399001991";
}
/** 平台名称 */
-(NSString *) platformName {
    return @"美数";
}

@end
