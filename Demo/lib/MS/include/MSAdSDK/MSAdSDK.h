//
//  MSAdSDK.h
//  MSAdSDK
//
//  Created by yang on 2019/8/5.
//  Copyright © 2019年 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSAdSDK : NSObject

+ (void)setAppId:(NSString *)appId;

+ (NSString *)appId;

+ (void)setDebug:(BOOL)isDebug;

+ (NSString *)getVersionName;

+ (NSInteger)getVersionCode;

/**
 * 1 - 只支持 http 协议
 * 2 - 只支持 https 协议
 * 3 - http、https 协议都支持（默认值）
 */
+ (void)setSecure:(NSInteger)secure;

+ (void)setHttpsSupport:(BOOL)isSupportHttps;

@end
