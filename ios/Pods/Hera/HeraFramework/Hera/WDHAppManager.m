//
//  WDHAppManager.m
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHLoadingView.h"
#import "NSURLProtocol+WebKitSupport.h"

@interface WDHAppManager ()

@property (nonatomic, copy) NSMutableArray *apps;

@end

@implementation WDHAppManager

#pragma mark - Init

- (instancetype)init {
	
	if (self = [super init]) {
		_apps = [NSMutableArray array];
	}
	
	return self;
}

+ (instancetype)sharedManager {
	
	static WDHAppManager *_appManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if (!_appManager) {
			_appManager = [[WDHAppManager alloc] init];
		}
	});
	
	return _appManager;
}

#pragma mark - 小程序栈管理

- (void)addApp:(WDHApp *)app {
	if (app) {
		[self.apps addObject:app];
	}
}

- (void)removeApp:(WDHApp *)app {
	[self.apps removeObject:app];
	
	// 如果全部小程序退出 做清理工作
	if (self.apps.count <= 0) {
		[self cleanWDHodoer];
	}
}

- (WDHApp *)currentApp {
	return [self.apps lastObject];
}

#pragma mark - Helper 

- (void)cleanWDHodoer {
	
	// 清理所有loading框
	[WDHLoadingView removeAllLoading];
	
	// 注销schema拦截
	[NSURLProtocol wk_unregisterScheme:@"wdfile"];
}

@end
