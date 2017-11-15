//
//  WDHSystemConfig.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDHSystemConfig : NSObject

+ (instancetype)sharedConfig;

/// 是否debug模式 调试使用
@property (nonatomic, assign) BOOL isDebug;

@end
