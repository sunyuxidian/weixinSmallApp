//
//  WHE_setClipboardData.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 设置系统剪贴板的内容
 */
@interface WHE_setClipboardData : WHEBaseApi

/// 需要设置的内容
@property (nonatomic, copy) NSString *data;

@end
