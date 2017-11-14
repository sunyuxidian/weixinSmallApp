//
//  WDHService.m
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHService.h"
#import "WDHBridge.h"
#import "NSObject+WDHJson.h"
#import "WDHScriptMessageHandlerDelegate.h"

@interface WDHService ()<WDHServiceBridgeProtocol>

@property (nonatomic, strong) WDHBridge *serviceBridge;

@property (nonatomic, strong) UIWebView *webView_old;

@property (nonatomic, strong) WKWebView *webView;



@end

NSString * kWDHServiceOpenTypeAppLaunch = @"appLaunch";
NSString * kWDHServiceOpenTypeNavigateBack = @"navigateBack";
NSString * kWDHServiceOpenTypeRedirectTo = @"redirectTo";

@implementation WDHService

- (void)dealloc
{
	NSLog(@"deinit WDHService");
}

- (instancetype)initWithAppConfiguration:(NSDictionary *)appConfiguration manager:(WDHManager *)manager
{
    if (self = [super init]) {
		self.serviceBridge = [[WDHBridge alloc] initWithWebViewDelegate:self managerDelegate:(id<WDHManagerProtocol>)manager];
		WKUserContentController *userContentController = [self.serviceBridge getBridgeUserContentController];
		WKWebViewConfiguration *configuration = WKWebViewConfiguration.new;
		configuration.userContentController = userContentController;
		
		WKWebView *webView = [[WKWebView alloc] initWithFrame:(CGRect){0,0,1,1} configuration:configuration];
		NSString *serviceHtmlPath = appConfiguration[@"service_html"];
		
		NSString *serviceHtmlFilePath = [NSString stringWithFormat:@"file://%@",serviceHtmlPath];
		NSString *fileEncodePath = [serviceHtmlFilePath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
		NSURL *fileURL = [NSURL URLWithString:fileEncodePath];
		NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
		[webView loadRequest:request];
		self.webView = webView;
    }
    
    NSLog(@"<service>:finish load html------");
    
    return self;
}

- (void)serviceBridgeDidNeedInjectScript:(NSString *)script completionHandler:(void (^)(id, NSError *))completionHandler
{
    [self evaluateJavaScript:script completionHandler:completionHandler];
}

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void(^)(id result,NSError *error))completionHandler
{

	[self.webView evaluateJavaScript:javaScriptString completionHandler:completionHandler];
}

- (void)loadConfigFileWithCompletion:(void(^)(NSDictionary *dic))completion
{
	[self.serviceBridge loadConfigFileWithCompletion:^(NSDictionary *dic) {
		self.appConfig = dic;
		if (completion) {
			completion(dic);
		}
	}];
}

- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam webId:(unsigned long long)webId {
	[self.serviceBridge callSubscribeHandlerWithEvent:eventName jsonParam:jsonParam webId:webId];
}

- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam {
	[self.serviceBridge callSubscribeHandlerWithEvent:eventName jsonParam:jsonParam];
}

- (void)publishCallbackHandler:(NSString *)callbackId {
    
//    if (self.useOldJSBridge) {
//        [self.serviceBridge_old publishCallbackHandler:self.webView_old callbackId:callbackId];
//    }

}

- (void)invokeCallbackHandler:(int)callbackId param:(NSString *)param
{
	[self.serviceBridge invokeCallbackHandlerWithCallbackId:callbackId param:param];
}

- (void)onAppRoute:(NSString *)routeType htmlPath:(NSString *)htmlPath queryString:(NSString *)queryString webId:(unsigned long long)webId
{
    NSMutableDictionary *queryDictionary = [NSMutableDictionary new];
    if (queryString) {
        NSArray *queryArray = [queryString componentsSeparatedByString:@"&"];
        for (NSString *queryItem in queryArray) {
            NSArray *pairs = [queryItem componentsSeparatedByString:@"="];
            if (pairs.count > 1) {
                NSString *key = pairs.firstObject;
                NSString *value = pairs.lastObject;
                queryDictionary[key] = value;
            }
        }
    }
	
	//htmlPath去除query部分
	NSString *path = nil;
	NSRange range = [htmlPath rangeOfString:@"?"];
	if (range.location != NSNotFound) {
		path = [htmlPath substringToIndex:range.location];
	} else {
		path = htmlPath;
	}
    
    NSDictionary *param = nil;
    if (queryDictionary.count) {
        param = @{@"openType":routeType,@"path":path,@"query":queryDictionary};
    }else {
        param = @{@"openType":routeType,@"path":path};
    }
    
    NSString *jsonParam  = [param wdh_jsonString];
    [self callSubscribeHandlerWithEvent:@"onAppRoute" jsonParam:jsonParam webId:webId];
}


@end
