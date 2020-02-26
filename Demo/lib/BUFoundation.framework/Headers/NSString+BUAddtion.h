//
//  NSString+URLEncoding.h
//  BUAdSDK
//
//  Created by carl on 2017/10/26.
//  Copyright © 2017年 bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BU_URLCoding)
- (NSString *)bu_URLEncodedString;
- (NSString *)bu_URLDecodedString;
@end

@interface NSString (BU_Encryption)
- (NSString *)bu_sha256;
/**
 * @brief 返回自身的md5
 * @return 返回自身的md5的16进制字串
 */
- (NSString *)bu_MD5HashString;
@end

@interface NSString (BU_NumberToWan)
/// 数字转换成x万(以1w为界限，小于1w显示原始数字)
+ (NSString *)bu_numberToWan:(NSInteger)target;
@end

@interface NSString (BU_URLStringAppend)
/*
 *
 string转URL
 */
+ (NSURL *)bu_URLWithURLString:(NSString *)str;
/*
 *
 string转字典
 */
+ (NSDictionary*)bu_parametersOfURLString:(NSString*)urlString;
/*
 *
 url字符串拼接参数,需要判断是否是第一个
 */
+ (NSString *)bu_urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters;
@end


@interface NSString (BU_Sandbox)
/**
 *  获取缓存路径
 *
 *  @return path where to cache
 */
- (NSString *)bu_CachePath;

/**
 * @brief 获取程序的用户文档目录的路径加上自身
 * @return 用户文档目录路径字串加上自身，该字符串是自动释放的
 */
- (NSString *)bu_DocumentsPath;
@end


@interface NSString(BU_JSONValue)

- (id)bu_JSONValue:(NSError **)error;
+ (id)bu_objectWithJSONData:(NSData *)inData error:(NSError **)outError;

@end


@interface NSString(BU_Time)

+ (NSString*)bu_dateNowString;

+ (NSString*)bu_dateStringSince:(NSTimeInterval)timeInterval;

+ (NSNumber*)bu_currentInterval;

@end


@interface NSString(BU_Random)

/*  @deccription生成随机字符
 *  @param count 多少位随机数
 */
+ (NSString *)randomStringWithCount:(NSUInteger)count;
@end


