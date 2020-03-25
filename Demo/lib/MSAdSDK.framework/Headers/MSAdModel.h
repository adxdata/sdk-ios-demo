//
//  MSAdModel.h
//  MSAdSDK
//
//  Created by yang on 2019/8/28.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSDKModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MSCreativeType) {
    MSCreativeTypeImage = 1, // 图片
    MSCreativeTypeVideo = 2, // 视频
    MSCreativeTypeSmallImage = 11, // 小图
    MSCreativeTypeLargeImage = 12, // 大图
    MSCreativeTypeThreeImage = 13, // 三图
    MSCreativeTypePrerender = 100000, // 预渲染
};

@interface MSAdModel : NSObject
@property (nonatomic , copy) NSString              * req_id;
@property (nonatomic , copy) NSString              * ader_id;
@property (nonatomic , copy) NSString              * cid;
@property (nonatomic , strong) NSArray <NSString *>              * clickUrl;
@property (nonatomic , assign) MSCreativeType              creative_type;   //创意类型
@property (nonatomic , strong) NSArray <NSString *>              * dUrl;
@property (nonatomic , assign) NSInteger              height;
@property (nonatomic , strong) NSArray <NSString *>              * monitorUrl;
@property (nonatomic , strong) NSArray <NSString *>              * responUrl;
@property (nonatomic , copy) NSString              * pid;
@property (nonatomic , strong) NSArray <NSString *>              * srcUrls;
@property (nonatomic , assign) NSInteger              target_type;//广告交互类型(0:网页跳转,1:下载) 默认 值:0
@property (nonatomic , assign) NSInteger              width;

@property (nonatomic , strong) NSArray <NSString *>              * down_url;


@property (nonatomic , copy) NSString              * deep_link;//deep_link 落地页地址(媒体支持 deeplink 落地页,应优先处理 deep_link,当无法处理 deep_link 时(如 用户未安装相应 app)再转而处理 dUrl, 如果 deep_link 可以落地则无须处理 dUrl,如果媒体不支持 deeplink 可以直 接处理 dUrl)

@property (nonatomic , copy) NSString              * video_cover;//音视频封面图地址

@property (nonatomic , copy) NSString              * video_endcover;//视频播放完成后，需要展示的封面图

@property (nonatomic , assign) NSInteger               video_keep_time;//强制观看时长(单位/秒)，此字段不存在或 等于 0 表示观看全部视频

@property (nonatomic , assign) NSInteger               video_preload_time;//视频预加载后的有效时间(在该时间间隔内 播放为有效，单位/秒), 此字段不存在或 等于 0 表示不允许预加载
@property (nonatomic , copy) NSString              * video_endpage_html;//视频播放完成后，需要用 webview 渲染的 HTML

@property (nonatomic , copy) NSString              * action_text;//引导行动语:查看详情、立即下载...

@property (nonatomic , assign) NSInteger              video_duration;//音视频时长(单位/秒)

@property (nonatomic , assign) NSInteger              clickable_range;// 激励视频的点击范围，1：只有按钮可点，2：全屏幕可点

@property (nonatomic , copy) NSString              * title;//标题
@property (nonatomic , copy) NSString              * content;//摘要、􏰁述
@property (nonatomic , copy) NSString              * icon;//角标(品牌 Logo、广告主头像等)
@property (nonatomic , copy) NSString              * icon_title;//角标标题(品牌名、广告主名)
@property (nonatomic , copy) NSString              * from_logo;//广告来源 logo icon (一般放于广告位右 下角)
@property (nonatomic , copy) NSString              * from;//来源
@property (nonatomic , copy) NSString              * app_name;//应用名称
@property (nonatomic , copy) NSString              * package_name;//应用包名
@property (nonatomic , strong) NSArray <NSString *>              * dn_start;
@property (nonatomic , strong) NSArray <NSString *>              * dn_succ;
@property (nonatomic , strong) NSArray <NSString *>              * dn_inst_start;
@property (nonatomic , strong) NSArray <NSString *>              * dn_inst_succ;
@property (nonatomic , strong) NSArray <NSString *>              * dn_active;
@property (nonatomic , strong) NSArray <NSString *>              * dp_start;
@property (nonatomic , strong) NSArray <NSString *>              * dp_succ;
@property (nonatomic , strong) NSArray <NSString *>              * dp_fail;
@property (nonatomic , strong) NSArray <NSString *>              * video_start;
@property (nonatomic , strong) NSArray <NSString *>              * video_one_quarter;
@property (nonatomic , strong) NSArray <NSString *>              * video_one_half;
@property (nonatomic , strong) NSArray <NSString *>              * video_three_quarter;
@property (nonatomic , strong) NSArray <NSString *>              * video_complete;
@property (nonatomic , strong) NSArray <NSString *>              * video_pause;
@property (nonatomic , strong) NSArray <NSString *>              * video_resume;
@property (nonatomic , strong) NSArray <NSString *>              * video_skip;
@property (nonatomic , strong) NSArray <NSString *>              * video_mute;
@property (nonatomic , strong) NSArray <NSString *>              * video_unmute;
@property (nonatomic , strong) NSArray <NSString *>              * video_replay;
@property (nonatomic , strong) NSArray <NSString *>              * video_close;
@property (nonatomic , strong) NSArray <NSString *>              * video_full;
@property (nonatomic , strong) NSArray <NSString *>              * video_exit_full;

@property (nonatomic , strong) NSMutableArray <MSSDKModel *>              * sdk;

@property (nonatomic , assign) NSInteger  sort;
@property (nonatomic , strong) NSMutableDictionary *extention;
@property (nonatomic , assign) BOOL isMSLoaded;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)provinceWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
