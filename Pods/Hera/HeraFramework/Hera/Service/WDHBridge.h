//
//  WDHBridge.h
//  WDHodoer
//
//  Created by acorld on 2017/7/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

#import "WDHServiceBridgeProtocol.h"
#import "WDHManagerProtocol.h"

@interface WDHBridge : NSObject

- (instancetype)initWithWebViewDelegate:(id<WDHServiceBridgeProtocol>)webViewDelegate managerDelegate:(id<WDHManagerProtocol>)managerDelegate;

- (WKUserContentController *)getBridgeUserContentController;

- (void)loadConfigFileWithCompletion:(void(^)(NSDictionary *))completion;

- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam webId:(unsigned long long)webId;

- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam;

- (void)invokeCallbackHandlerWithCallbackId:(int)callbackId param:(NSString *)param;

@end
