//
//  WDHPageManagerProtocol.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#ifndef WDHPageManagerProtocol_h
#define WDHPageManagerProtocol_h

@class WDHPageBaseViewController;

//页面管理的协议
//WHPageManager做为协调者，代理各个需求方实现这些协议
//需求方有 WHMananger, WHPageApi, WDHPageBaseViewController, WDHPageBridge
@protocol WDHPageManagerProtocol <NSObject>

//开始一个页面
- (void)startPage:(NSString *)basePath pagePath:(NSString *)pagePath openNewPage:(BOOL)openNewPage;
//退出栈顶一个页面
- (void)pop;
//页面栈长
- (int)stackLength;

//调js
//- (void)callSubscribeHandlerWithEventName:(NSString *)eventName jsonParam:(NSString *)jsonParam webIds:(NSArray *)webIds;
- (void)callSubscribeHandler:(NSString *)eventName jsonParam:(NSString *)jsonParam webIds:(NSArray *)webIds;

- (void)callPageConfig:(unsigned long long)webId;

- (BOOL)isRootPage:(UIViewController *)page;

//Active View State
- (void)activePageDidDisappear:(WDHPageBaseViewController *)vc;
- (void)activePageDidAppear:(WDHPageBaseViewController *)vc;
- (void)activePageWillAppear:(WDHPageBaseViewController *)vc;

@end



//js与webiew之间的桥接协议
@protocol WDHPageBridgeJSProtocol <NSObject>

    //收到js消息
- (void)onReceiveJSMessage:(NSString *)name body:(id)body controller:(WDHPageBaseViewController *)controller;
    
- (void)onReceiveJSAlert:(NSString *)message;
    
    //调js
- (void)callJS:(NSString *)js controller:(WDHPageBaseViewController *)controller callback:(void (^)(id result))callback;
    
@end

#endif /* WDHPageManagerProtocol_h */
