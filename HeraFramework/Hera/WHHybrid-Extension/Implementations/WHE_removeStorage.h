//
//  WHE_removeStorage.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 从本地缓存中异步移除指定 key
 */
@interface WHE_removeStorage : WHEBaseApi

/// 本地缓存中的指定的 key
@property (nonatomic, copy) NSString *key;

@end
