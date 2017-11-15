//
//  WHE_setStorage.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 将数据存储在本地缓存中指定的 key 中，会覆盖掉原来该 key 对应的内容，这是一个异步接口。
 */
@interface WHE_setStorage : WHEBaseApi

/// 本地缓存中的指定的 key
@property (nonatomic, copy) NSString *key;

/// 需要存储的内容
@property (nonatomic, copy) id data;

/// 数据类型
@property (nonatomic, copy) NSString *dataType;

@end
