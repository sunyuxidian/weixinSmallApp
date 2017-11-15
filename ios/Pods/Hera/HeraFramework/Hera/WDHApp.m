//
//  WDHApp.m
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHApp.h"
#import "WDHFileManager.h"
#import "WDHManager.h"
#import "WHHybridExtension.h"
#import "WDHAppManager.h"
#import "WDHManager.h"
#import "NSObject+WDHJson.h"
#import "WDHBaseViewController.h"

@interface WDHApp ()

@property (nonatomic, strong) WDHManager *manager;

@end

@implementation WDHApp

- (instancetype)initWithAppInfo:(WDHAppInfo *)appInfo {
	
	if (self = [super init]) {
		_appInfo = appInfo;
	}

	return self;
}

#pragma mark - Helper

- (BOOL)isAppRootPage:(UIViewController *)page {
	return [self.manager.pageManager isRootPage:page];
}

#pragma mark - Listen

- (void)didReceiveMessage:(NSDictionary *)message {
	NSDictionary *data = nil;
	if (message && [message isKindOfClass:NSDictionary.class]) {
		data = message[@"data"];
		if(!data || ![data isKindOfClass:NSDictionary.class]){
			data = @{};
		}
	} else {
		data = @{};
	}
	
	[self.manager.extensionApi didRecieveApiResponseData:data];
}

#pragma mark - Life Cyle

- (void)startAppWithEntrance:(UINavigationController *)entrance {
	
	_manager = [[WDHManager alloc] initWithAppInfo:self.appInfo];
	[_manager setupEntrance:entrance];
	[_manager startService];
	
	[[WDHAppManager sharedManager] addApp:self];
}

- (void)stopApp {
	
	[self.manager stopService];
	[self.manager.pageManager resetNavigationBarHidden];
	[[WDHAppManager sharedManager] removeApp:self];
}

- (void)onAppEnterBackground {
	[self.manager.pageManager resetNavigationBarHidden];
	[self.manager.service callSubscribeHandlerWithEvent:@"onAppEnterBackground" jsonParam:[@{@"mode": @"hang"} wdh_jsonString]];
}

- (void)onAppEnterForeground {
	
	[self.manager.service callSubscribeHandlerWithEvent:@"onAppEnterForeground" jsonParam: @"{}"];
	
	//重置UserAgent
	NSString *userAgent = [[[UIWebView alloc] init] stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
	NSString * customUA = [userAgent stringByAppendingFormat:@" Hera(JSBridgeVersion/3.0)"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent" : customUA}];
}

@end
