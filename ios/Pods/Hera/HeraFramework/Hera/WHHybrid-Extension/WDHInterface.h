//
//  WDHInterface.h
//  Hera
//
//  Created by WangYiqiao on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UINavigationController;
@class WDHAppInfo;

@interface WDHInterface : NSObject

+ (instancetype)sharedInterface;

/**
 开启小程序

 @param appInfo 小程序配置信息
 @param completion 启动回调 success: YES:启动成功 NO:启动失败 msg:回调信息
 */
- (void)startAppWithAppInfo:(WDHAppInfo *)appInfo entrance:(UINavigationController *)entrance completion:(void(^)(BOOL success, NSString *msg))completion;

/**
 获取当前sdk版本号

 @return 当前sdk版本号
 */
- (NSString *)sdkVersion;

@end
