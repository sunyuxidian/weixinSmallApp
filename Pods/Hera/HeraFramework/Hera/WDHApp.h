//
//  WDHApp.h
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHSystemConfig.h"
#import "WDHAppInfo.h"

@class UINavigationController;
@class UIViewController;

@interface WDHApp : NSObject

/**
 小程序配置信息
 */
@property (nonatomic, strong) WDHAppInfo *appInfo;

/**
 初始化

 @param appInfo 小程序配置信息
 @return 小程序实例
 */
- (instancetype)initWithAppInfo:(WDHAppInfo *)appInfo;

/**
 开启小程序
 */
- (void)startAppWithEntrance:(UINavigationController *)entrance;

/**
 停止小程序
 */
- (void)stopApp;

/**
 小程序进入前台
如果从非小程序页面进入小程序页面 则认为小程序进入前台 初始化进入除外
 */
- (void)onAppEnterForeground;

/**
 小程序进入后台
 如果将要展示的页面不是小程序页面 则认为小程序进入后台
 */
- (void)onAppEnterBackground;

/**
 判断是否为小程序根页面

 @return YES:是 NO:否
 */
- (BOOL)isAppRootPage:(UIViewController *)page;

/**
 收到外部消息

 @param message 消息内容
 */
- (void)didReceiveMessage:(NSDictionary *)message;

@end
