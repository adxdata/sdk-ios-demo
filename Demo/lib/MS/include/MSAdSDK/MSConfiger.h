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
@property (nonatomic) BOOL isIpad;

+ (instancetype)share;
- (void)update:(NSString*)baseUrl;
- (void)loadAd:(MSAdModel*)model gdtCalllback:(void(^)(MSSDKModel* sdkModel))gdtCalllback csjCallback:(void(^)(MSSDKModel* sdkModel))csjCallback msCallback:(void(^)(MSAdModel* msModel))msCallback msEmptycallback:(void(^)(NSError* error))msEmptycallback;
@end

NS_ASSUME_NONNULL_END
