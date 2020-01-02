//
//  IdProviderFactory.h
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAdIdProvider.h"
#import "BDIdProvider.h"
#import "MSIdProvider.h"
#import "CSJIdProvider.h"
#import "GDTIdProvider.h"

typedef NSString * PlatformName;
extern PlatformName const _Nonnull PlatformNameMS;
extern PlatformName const _Nonnull PlatformNameCSJ;
extern PlatformName const _Nonnull PlatformNameGDT;
extern PlatformName const _Nonnull PlatformNameBD;

@interface IdProviderFactory : NSObject

+ (instancetype) sharedIdProviderFactory;

-(void) setDefaultPlatform:(NSString *) platformName;

-(IAdIdProvider *) getProvider:(NSString *) platformName;

-(IAdIdProvider *) getDefaultProvider;

@end
