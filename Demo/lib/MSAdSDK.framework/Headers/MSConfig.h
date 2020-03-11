//
//  MSConfig.h
//  MSAdSDK
//
//  Created by zzq on 2020/3/11.
//  Copyright © 2020 yang. All rights reserved.
//

@interface MSConfig : NSObject

/**
 性别:(-1:未知、男:01、女:10)
 */
+ (void)setGender:(MSGender)gender;

+ (MSGender)getGender;

/**
 4 位数字出生年
 */
+ (void)setYob:(NSString *)yob;

+ (NSString *)getYob;

/**
 用户感兴趣关键词多个用英文逗号隔(Get 请求需做 urlencode)
 */
+ (void)setKeywords:(NSString *)keywords;

+ (NSString *)getKeywords;

@end
