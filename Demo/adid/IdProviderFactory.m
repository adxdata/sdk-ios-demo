//
//  IdProviderFactory.m
//  Demo
//
//  Created by zzq on 2019/12/31.
//  Copyright © 2019 bwhx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IdProviderFactory.h"

PlatformName const PlatformNameMS = @"meishu";
PlatformName const PlatformNameCSJ = @"csj";
PlatformName const PlatformNameGDT = @"gdt";
PlatformName const PlatformNameBD = @"bd";

@interface IdProviderFactory ()

@property (strong, nonatomic) NSMutableDictionary *providers;
@property (strong) NSString *defaultPlatformName;

@end

@implementation IdProviderFactory

- (instancetype)init {
    self = [super init];
    if (self) {
        self.providers = [NSMutableDictionary new];
        [self.providers setValue:[MSIdProvider new] forKey:PlatformNameMS];
        [self.providers setValue:[CSJIdProvider new] forKey:PlatformNameCSJ];
        [self.providers setValue:[GDTIdProvider new] forKey:PlatformNameGDT];
        [self.providers setValue:[BDIdProvider new] forKey:PlatformNameBD];
        self.defaultPlatformName = PlatformNameMS;
    }
    return self;
}

+ (instancetype) sharedIdProviderFactory {
    static IdProviderFactory *sharedInstance;
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        sharedInstance = [IdProviderFactory new];
    });
    return sharedInstance;
}

-(void) setDefaultPlatform:(NSString *)platformName {
    self.defaultPlatformName = platformName;
}

-(IAdIdProvider *) getProvider:(NSString *)platformName {
    return [self.providers valueForKey:platformName];
}

-(IAdIdProvider *) getDefaultProvider {
    return [self getProvider:self.defaultPlatformName];
}

@end
