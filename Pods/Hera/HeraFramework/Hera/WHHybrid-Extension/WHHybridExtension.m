    //
//  WHHybridExtension.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHHybridExtension.h"
#import "WHEBaseApi.h"
#import <Hera/WDHodoer.h>
#import "WDHybridExtensionConverter.h"
#import "WDHApiRequest.h"
#import "WDHAppManager.h"
#import "WDHApp.h"


NSString *const WDHExtensionKeyCode = @"code";
NSString *const WDHExtensionKeyData = @"data";

@interface WHHybridExtension ()

///需要从业务方获取数据的请求
@property (nonatomic, strong) WDHApiRequest *businessDataRequest;

@end

/// 扩展的api信息数组
static NSMutableDictionary *extensionApis = nil;

@implementation WHHybridExtension

/*注册扩展的api，对业务宿主有用*/
+ (void)registerExtensionApi:(NSString *)api handler:(id(^)(id))handler
{
    if (!extensionApis) {
        extensionApis = [NSMutableDictionary new];
    }
    
    extensionApis[api] = handler;
}

+ (void)sendMessage:(NSDictionary *)message {
	WDHApp *currentApp = [[WDHAppManager sharedManager] currentApp];
	[currentApp didReceiveMessage:message];
}

#pragma mark - WDHApiProtocol
#pragma mark -

- (void)didRecieveHybridApiWithApi:(WDHApiRequest *)request
{
	//优先常规api
	WHEBaseApi *api = [WDHybridExtensionConverter apiWithRequest:request];
	if (api) {
		
		[api setupApiWithSuccess:^(NSDictionary<NSString *,id> * _Nonnull result) {
			
			if (request.callback) {
				dispatch_async(dispatch_get_main_queue(), ^{
					request.callback(result);
				});
			}
		} failure:^(NSDictionary* _Nullable failureInfo) {
			
			if (request.callback) {
				NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:failureInfo];
				[result setObject:[NSString stringWithFormat:@"%@:fail",request.command] forKey:@"errMsg"];
				
				dispatch_async(dispatch_get_main_queue(), ^{
					request.callback(result);
				});
			}
		} cancel:^{
			
			if (request.callback) {
				NSDictionary *result = @{@"errMsg":[NSString stringWithFormat:@"%@:cancel",request.command]};
				
				dispatch_async(dispatch_get_main_queue(), ^{
					request.callback(result);
				});
			}
		}];
		
		return;
	}
	
    //扩展的api
    if (extensionApis[request.command]) {
        id(^methodCall)(id data) = extensionApis[request.command];
        NSDictionary<NSString *,id> * _Nonnull result = methodCall(request.param);
        NSInteger requestCode = -1;
        if (result[WDHExtensionKeyCode]) {
            requestCode = [result[WDHExtensionKeyCode] integerValue];
        }
        
        //结果码
        NSDictionary *data = result[WDHExtensionKeyData];
        switch (requestCode) {
            case WDHExtensionCodeSuccess:
				if ([request.command isEqualToString:@"openPageForResult"]) {
					self.businessDataRequest = request;
					return;
				}
				
                if (request.callback) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        request.callback(data);
                    });
                }
                break;
            case WDHExtensionCodeCancel:
            {
                if (request.callback) {
                    NSDictionary *result = @{@"errMsg":[NSString stringWithFormat:@"%@:cancel",request.command]};
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        request.callback(result);
                    });
                }
                break;
            }
            case WDHExtensionCodeFailure:
            {
                if (request.callback) {
                    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:data];
                    [result setObject:[NSString stringWithFormat:@"%@:fail",request.command] forKey:@"errMsg"];
					
                    dispatch_async(dispatch_get_main_queue(), ^{
                        request.callback(result);
                    });
                }
                break;
            }
            default:
                break;
        }
        
        return;
    }
    
}

- (void)didRecieveApiResponseData:(NSDictionary *)data {
	if (self.businessDataRequest.callback) {
		dispatch_async(dispatch_get_main_queue(), ^{
			self.businessDataRequest.callback(data ? data: @{});
			self.businessDataRequest = nil;
		});
	}
}

@end
