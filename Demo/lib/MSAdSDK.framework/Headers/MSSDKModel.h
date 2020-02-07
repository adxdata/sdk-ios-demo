//
//  MSSDKModel.h
//  MSAdSDK
//
//  Created by yang on 2019/9/3.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSSDKModel : NSObject
@property (nonatomic , copy) NSString              * sdk;
@property (nonatomic , copy) NSString              * app_id;
@property (nonatomic , copy) NSString              * pid;
@property (nonatomic , copy) NSString              * req;
@property (nonatomic , copy) NSString              * rsp;
@property (nonatomic , copy) NSString              * imp;
@property (nonatomic , copy) NSString              * clk;
@property (nonatomic) BOOL readed;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)provinceWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
