//
//  WHE_getFileInfo.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_getFileInfo : WHEBaseApi

// 本地文件路径
@property (nonatomic, copy) NSString *filePath;

// 计算文件摘要的算法，默认值 md5，有效值：md5，sha1
@property (nonatomic, copy) NSString *digestAlgorithm;

@end
