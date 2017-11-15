//
//  AppDelegate.m
//  WDHodoerDemo
//
//  Created by acorld on 2017/7/20.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RetrieveViewController.h"
#import "LinkViewController.h"
#import <Hera/WHHybridExtension.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	//注册自实现API
	[WHHybridExtension registerExtensionApi:@"openPage" handler:^id(id param) {
		UIViewController *vc = [[UIViewController alloc] init];
		UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
		[navi pushViewController:vc animated:YES];
		
		return @{WDHExtensionKeyCode:@(WDHExtensionCodeSuccess)};
	}];
	
	[WHHybridExtension registerExtensionApi:@"openLink" handler:^id(id param) {
		LinkViewController *vc = [[LinkViewController alloc] init];
		vc.url = param[@"url"];
		UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
		[navi pushViewController:vc animated:YES];

		return @{WDHExtensionKeyCode:@(WDHExtensionCodeSuccess)};
	}];
	
	[WHHybridExtension registerRetrieveApi:@"getResult" handler:^id(id param, WDHApiCompletion completion) {
		
		RetrieveViewController *vc = [[RetrieveViewController alloc] init];
		if([vc respondsToSelector:@selector(didReceiveApi:withParam:completion:)]){
			[vc didReceiveApi:@"getResult" withParam:param completion:completion];
		}
		UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
		[navi pushViewController:vc animated:YES];
		
		return @{WDHExtensionKeyCode:@(WDHExtensionCodeSuccess)};
	}];
	
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


@end
