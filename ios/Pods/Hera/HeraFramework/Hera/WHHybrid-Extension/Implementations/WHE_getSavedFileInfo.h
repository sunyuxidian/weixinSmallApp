//
//  WHE_getSavedFileInfo.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 获取本地文件的文件信息。此接口只能用于获取已保存到本地的文件，
 若需要获取临时文件信息，请使用 WHE_ getFileInfo 接口
 */
@interface WHE_getSavedFileInfo : WHEBaseApi

// 文件路径
@property (nonatomic, copy) NSString *filePath;

@end
