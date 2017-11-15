//
//  WHE_openDocument.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"


/**
 新开页面打开文档，支持格式：
 doc, xls, ppt, pdf, docx, xlsx, pptx
 */
@interface WHE_openDocument : WHEBaseApi

// 文件路径，可通过 downFile 获得
@property (nonatomic, copy) NSString *filePath;

// 文件类型，指定文件类型打开文件，有效值 doc, xls, ppt, pdf, docx, xlsx, pptx
@property (nonatomic, copy) NSString *fileType;

@end
