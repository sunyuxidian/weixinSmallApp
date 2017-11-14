//
//  WDHAppManager.h
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDHApp;

@interface WDHAppManager : NSObject

+ (instancetype)sharedManager;

/**
 添加小程序
 */
- (void)addApp:(WDHApp *)app;

/**
 移除小程序
 */
- (void)removeApp:(WDHApp *)app;

/**
 获取当前运行的小程序
 */
- (WDHApp *)currentApp;

@end
