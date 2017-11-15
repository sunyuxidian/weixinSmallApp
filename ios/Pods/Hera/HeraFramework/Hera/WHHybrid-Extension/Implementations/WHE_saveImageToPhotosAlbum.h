//
//  WHE_saveImageToPhotosAlbum.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_saveImageToPhotosAlbum : WHEBaseApi

// 图片文件路径，可以是临时文件路径也可以是永久文件路径，不支持网络图片路径
@property (nonatomic, copy) NSString *filePath;

@end
