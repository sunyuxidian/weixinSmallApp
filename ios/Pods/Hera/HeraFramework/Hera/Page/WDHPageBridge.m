//
//  WDHPageBridge.m
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHPageBridge.h"
#import "WDHBaseViewController+Extension.h"
#import "WDHPageModel.h"

@implementation WDHPageBridge

//MARK: - 收到JS消息
- (void)onReceiveJSMessage:(NSString *)name body:(id)body controller:(WDHPageBaseViewController *)controller
{
    self.controller = controller;

    NSString *pageName = controller.pageModel.pagePath;
	NSLog(@"view2app_get--->desc: %@", @{@"page":pageName ,@"event":name,@"info":body});

    if ([name isEqualToString:@"invokeHandler"]) {
        [self invokeHandler:body];
    }else if ([name isEqualToString:@"publishHandler"]){
        [self publishHandler:body];
    }

}

- (void)onReceiveJSAlert:(NSString *)message {

}

//MARK: - wk js invoke/publish handler
- (void)invokeHandler:(id)data {
    NSLog(@"<page> invokeHandler: %@",data);
}

- (void)publishHandler:(id)data
{
    NSLog(@"<page> publishHandler: %@",data);

    if (data) {
        NSString *e = data[@"event"];
        if (!e || !self.manager) {
            return;
        }

        if ([e isEqualToString:@"custom_event_DOMContentLoaded"]) {
            [self.controller track_page_ready];
        }

        if (data[@"paramsString"]) {
            [self.manager page_publishHandler:e param:data[@"paramsString"] pageModel:self.controller.pageModel callbackId:@""];
        }
    }

}

- (void)callJS:(NSString *)js controller:(WDHPageBaseViewController *)controller callback:(void (^)(id result))callback {
    NSLog(@"<page> 执行: %@",js);

    NSString *pageName = controller.pageModel.pagePath;
	NSLog(@"app2view--->: desc: %@", @{@"page":pageName,@"info":js});

    [controller.webView evaluateJavaScript:js completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        // NSLog(@"<page> %@ 执行结果：%@",js,result);
        if (callback) {
            callback(result);
        }
    }];

}

@end
