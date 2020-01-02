//
//  IAdIdProvider.h
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface IAdIdProvider : NSObject

/** 竖版激励视频 */
-(NSString *) rewardPortrait;
/** 横版激励视频 */
-(NSString *) rewardLandscape;
/** 信息流视频 */
-(NSString *) feedVideo;
/** 信息流三图一文 */
-(NSString *) feedThreeImgs;
/** 信息流上图下文 */
-(NSString *) feedImageVertical;
/** 信息流左图右文 */
-(NSString *) feedImageHorizon;
/** 信息流左图右文图文摘要 */
-(NSString *) feedImageHorizonDesc;
/** 信息流预渲染 */
-(NSString *) feedPreRender;
/** 纯视频 */
-(NSString *) video;
/** 视频暂停贴片 */
-(NSString *) videoImg;
/** 图片 */
-(NSString *) image;
/** 插屏 */
-(NSString *) insertScreen;
/** 开屏 */
-(NSString *) splash;
/** banner */
-(NSString *) banner;
/** 平台名称 */
-(NSString *) platformName;

@end
