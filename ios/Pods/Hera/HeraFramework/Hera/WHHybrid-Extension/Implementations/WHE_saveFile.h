//
//  WHE_saveFile.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_saveFile : WHEBaseApi

// 需要保存的文件的临时路径
@property (nonatomic, copy) NSString *tempFilePath;

@end
