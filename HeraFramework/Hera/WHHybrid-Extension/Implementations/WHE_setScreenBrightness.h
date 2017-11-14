//
//  WHE_setScreenBrightness.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 设置屏幕亮度
 */
@interface WHE_setScreenBrightness : WHEBaseApi

/// 屏幕亮度值，范围 0~1，0 最暗，1 最亮
@property (nonatomic, copy) NSString *value;

@end
