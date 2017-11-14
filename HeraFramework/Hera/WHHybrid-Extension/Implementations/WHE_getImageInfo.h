//
//  WHE_getImageInfo.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_getImageInfo : WHEBaseApi

/// 图片的路径，可以是相对路径，临时文件路径，存储文件路径，网络图片路径
@property (nonatomic, copy) NSString *src;

@end
