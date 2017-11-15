//
//  WDHManager.m
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHManager.h"
#import "NSObject+WDHJson.h"
#import "WDHPageModel.h"
#import "WDHURLProtocol.h"
#import "NSURLProtocol+WebKitSupport.h"
#import "WDHFileManager.h"

@interface WDHManager()

@property (nonatomic, strong) WDHAppInfo *appInfo;

@end

@implementation WDHManager

- (void)dealloc
{
	NSLog(@"deinit WDHManager");
}

- (instancetype)initWithAppInfo:(WDHAppInfo *)appInfo;
{
	if (self = [super init]) {
		
		_appInfo = appInfo;
		_pageManager = [WDHPageManager new];
		_extensionApi = [[WHHybridExtension alloc] init];
		_pageApi = [[WDHPageApi alloc] initWithPageManager:_pageManager];
		
		self.pageManager.whManager = self;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRefresh:) name:@"onPullDownRefresh" object:nil];
	}
	
	return self;
}

- (void)handleRefresh:(NSNotification *)notification {
	NSLog(@"%@", notification.object);
	[self.service callSubscribeHandlerWithEvent:notification.name jsonParam:@"{}" webId:[notification.object unsignedLongLongValue]];
}

- (void)setupEntrance:(UINavigationController *)controller
{
	[self.pageManager setupWithNaviController:controller];
}

- (void)startService
{
	NSLog(@"load_app_service");
	
	//拦截schema
	[NSURLProtocol registerClass:[WDHURLProtocol class]];
	[NSURLProtocol wk_registerScheme:@"wdfile"];
	
	//注册UA
	NSString *userAgent = [[[UIWebView alloc] init] stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
	NSString * customUA = [userAgent stringByAppendingFormat:@" Hera(JSBridgeVersion/3.0)"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent" : customUA}];
	
	NSDictionary *configuration = @{@"service_html":[WDHFileManager appServiceEnterencePath:_appInfo.appId],@"root":[WDHFileManager appSourceDirPath:_appInfo.appId]};
	self.service = [[WDHService alloc] initWithAppConfiguration:configuration manager:self];
}


- (void)stopService
{
	self.service = nil;
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) startRootPage {
	self.pageManager.config = self.service.appConfig;
	NSDictionary *tabbar = self.service.appConfig[@"tabBar"];
	if (tabbar) {
		NSString *rootPagePath = self.service.appConfig[@"root"];
		[self.pageManager startTabarPage:self.service.appConfig basePath:[WDHFileManager appSourceDirPath:_appInfo.appId] defaultPagePath:rootPagePath];
	}else {
		NSString *rootPagePath = self.service.appConfig[@"root"];
		[self.pageManager startPage:[WDHFileManager appSourceDirPath:_appInfo.appId] pagePath:rootPagePath isRoot:YES];
	}
}

//MARK: - 实现协议方法
- (void)service_publishHandler:(NSString *)eventName param:(NSString *)param webIds:(NSArray *)webIds callbackId:(NSString *)callbackId
{
	//pageManager根据参数分发到具体页面
	if ([eventName isEqualToString:@"custom_event_appDataChange"]) {
		[self.pageManager callSubscribeHandler:eventName jsonParam:param webIds:webIds];
	}else if ([eventName isEqualToString:@"custom_event_serviceReady"]) {
		NSLog(@"app_service_ready");
		[self.service loadConfigFileWithCompletion:^(NSDictionary *dic) {
			//startLoad Page RootHtml
			[self startRootPage];
		}];
		
	}else if ([eventName isEqualToString:@"custom_event_H5_LOG_MSG"]) {
		NSDictionary *jsonParam = [param wdh_jsonObject];
		NSLog(@"custom_event_H5_LOG_MSG: %@", jsonParam);
	}else if ([eventName isEqualToString:@"custom_event_getConfig"]) {
		//加载项目配置文件
		NSDictionary *config = [param wdh_jsonObject];
		if (config) {
			self.service.appConfig = config;
			//startLoad Page RootHtml
			[self startRootPage];
		}
		
	} else {
		[self.pageManager callSubscribeHandler:eventName jsonParam:param webIds:webIds];
	}
	
	//publish的回调
	
	if (callbackId) {
		[self.service publishCallbackHandler:callbackId];
	}
}

- (void)page_publishHandler:(NSString *)eventName param:(NSString *)param pageModel:(WDHPageModel *)pageModel callbackId:(NSString *)callbackId
{
	
	NSString *url = [pageModel pagePathUrl];
	NSString * query = pageModel.query;
	unsigned long long webId = pageModel.pageId;
	
	//根据具体事件进行分发
	if ([eventName isEqualToString:@"custom_event_DOMContentLoaded"]) {
		NSString *opentype = pageModel.openType;
		if (opentype == nil) {
			opentype = @"appLaunch";
		}
		
		//MARK:发送onAppRoute事件
		[self.service onAppRoute:opentype htmlPath:url queryString:query webId:webId];
	}else if ([eventName isEqualToString:@"custom_event_getConfig"]) {
		NSDictionary *jsonParam = [param wdh_jsonObject];
		[self.pageManager loadPageConfig:webId pageConfig:jsonParam];
	}else if ([eventName isEqualToString:@"custom_event_PAGE_EVENT"]
			  || [eventName isEqualToString:@"custom_event_SPECIAL_PAGE_EVENT"]
			  || [eventName isEqualToString:@"custom_event_canvasInsert"]) {
		[self.service callSubscribeHandlerWithEvent:eventName jsonParam:param webId:webId];
	}else if ([eventName isEqualToString:@"custom_event_H5_LOG_MSG"]) {
		NSLog(@"custom_event_H5_LOG_MSG: %@", param);
	}else if ([eventName isEqualToString:@"custom_event_INVOKE_METHOD"]) {
		//demo使用方法
		[self.service callSubscribeHandlerWithEvent:eventName jsonParam:param webId:webId];
	} else if ([eventName isEqualToString:@"custom_event_SPECIAL_PAGE_EVENT"]) {
		[self.service callSubscribeHandlerWithEvent:eventName jsonParam:param webId:webId];
	} else if ([eventName isEqualToString:@"custom_event_canvasInsert"]) {
		[self.service callSubscribeHandlerWithEvent:eventName jsonParam:param webId:webId];
		
	} else if ([eventName isEqualToString:@"custom_event_H5_CONSOLE_LOG"]) {
		//控制台输出H5log
		NSLog(@"WDHodoer custom_event_H5_CONSOLE_LOG: %@", param);
	}
	
	//    else {
	//       [self.service callSubscribeHandlerWithEvent:eventName jsonParam:param webId:webId];
	//    }
	
}

- (void)service_apiRequest:(NSString *)command param:(NSString *)param callbackId:(int)callbackId
{
	NSLog(@"service_api--->command: %@, param: %@", command, param);
	
	NSDictionary *paramDic = [param wdh_jsonObject];
	WDHApiRequest *request = [[WDHApiRequest alloc] init];
	request.command = command;
	request.param = paramDic;
	request.callback = ^(NSDictionary<NSString *,NSObject *> *result) {
		if (!callbackId) {
			return;
		}
		
		NSString *resultJsonString = [result wdh_jsonString];
		
		if (!resultJsonString) {
			resultJsonString = @"{}";
		}
		
		NSLog(@"service_api--->api: %@, data: %@", command, resultJsonString);
		
		[self.service invokeCallbackHandler:callbackId param:resultJsonString];
	};
	
	[self.extensionApi didRecieveHybridApiWithApi:request];
}

- (void)service_innerApiRequest:(NSString *)command param:(NSString *)param callbackId:(int)callbackId
{
	NSDictionary *paramsDict = [param wdh_jsonObject];
	
	self.pageApi.basePath = [WDHFileManager appSourceDirPath:self.appInfo.appId];
	self.pageApi.service = self.service;
	
	[self.pageApi receive:command param:paramsDict callback:^(NSDictionary<NSString *,NSObject *> *result) {
		if (!callbackId) {
			return;
		}
		
		NSString *resultJsonString = [result wdh_jsonString];
		
		if (!resultJsonString) {
			resultJsonString = @"{}";
		}
		
		[self.service invokeCallbackHandler:callbackId param:resultJsonString];
	}];
}

@end
