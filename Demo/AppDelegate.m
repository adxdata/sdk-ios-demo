//
//  AppDelegate.m
//  MSSDKDemo
//
//  Created by yang on 2019/8/5.
//  Copyright © 2019年 yang. All rights reserved.
//

#import "AppDelegate.h"
#import "MSSplashAd.h"
#import "MSAdSDK.h"
#import "IdProviderFactory.h"

#import "MSNavigationController.h"
#import "MSAdViewController.h"
@interface AppDelegate ()<MSSplashAdDelegate>
@property (strong, nonatomic) MSSplashAd *splash;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [MSAdSDK setAppId:@"101647"];       // 设置应用id
    [MSAdSDK setTestMode:YES];          // 切换测试服务器，默认为生产服务器
    //    [MSAdSDK setHttpsSupport:YES];    // 请求广告服务器，默认用http协议，此接口用来切换是否使用https协议
    //    [MSAdSDK setSecure:1];            // 修改secure参数，0 - 只支持 http 协议, 1 - 只支持 https 协议, 2 - http、https 协议都支持（默认值）

    NSLog(@"美数SDK versionName:%@", [MSAdSDK getVersionName]);
    NSLog(@"美数SDK versionCode:%ld", [MSAdSDK getVersionCode]);
//    [MSAdSDK setAppId:@"101516"];
    [[IdProviderFactory sharedIdProviderFactory] setDefaultPlatform:PlatformNameMS];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MSAdViewController *vc = [[MSAdViewController alloc] init];
    MSNavigationController *nav = [[MSNavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.barStyle = UIBarStyleBlackOpaque;
    nav.navigationBar.topItem.title = [NSString stringWithFormat:@"广告形式   ver %@", [MSAdSDK getVersionName]];
    nav.navigationBar.translucent = NO;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
//    MSSplashAd *splash = [[MSSplashAd alloc]initWithNeedCustom:YES drawCustomView:^(UIView * _Nonnull adView) {
//
//    }];
//    splash.delegate = self;
//    splash.backgroundImage = [UIImage imageNamed:@"iPhoneX@2x"];
//    self.splash = splash;
//    [splash loadAdAndShowInWindow:self.window];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  开屏广告成功展示
 */
- (void)msSplashShow:(MSSplashAd *)splashAd{
    
}

/**
 *  开屏广告展示失败
 */
- (void)msSplashError:(MSSplashAd *)splashAd withError:(NSError *)error{

}


/**
 *  开屏广告点击回调
 */
- (void)msSplashClicked:(MSSplashAd *)splashAd{
    
}

/**
 *  开屏广告关闭回调
 */
- (void)msSplashClosed:(MSSplashAd *)splashAd{
//    self.splash = nil;
}

@end
