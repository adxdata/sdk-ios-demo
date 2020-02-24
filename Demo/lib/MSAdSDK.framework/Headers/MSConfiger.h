//
//  MSConfiger.h
//  MSAdSDK
//
//  Created by  xiaotu on 2019/11/26.
//  Copyright © 2019 yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSAdModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSConfiger : NSObject

@property (nonatomic, strong) NSString* baseUrl;
@property (nonatomic) BOOL isDebug;
@property (nonatomic) BOOL isIpad;
@property (nonatomic) NSInteger secure;
@property (nonatomic) BOOL isSupportHttps;

+ (instancetype)share;

- (void)update:(NSString*)baseUrl;

- (void)setIsDebug:(BOOL)isDebug;

- (void)loadAd:(MSAdModel*)model
        gdtCalllback:(void(^)(MSSDKModel* sdkModel))gdtCalllback
        csjCallback:(void(^)(MSSDKModel* sdkModel))csjCallback
        bdCallback:(void(^)(MSSDKModel* msModel))bdCallback
        msCallback:(void(^)(MSAdModel* msModel))msCallback
        msEmptycallback:(void(^)(NSError* error))msEmptycallback;
@end

NS_ASSUME_NONNULL_END
