//
//  WHE_removeSavedFile.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 删除本地存储的文件
 */
@interface WHE_removeSavedFile : WHEBaseApi

// 需要删除的文件路径
@property (nonatomic, copy) NSString *filePath;

@end
