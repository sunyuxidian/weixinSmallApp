//
//  WHE_showActionSheet.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_showActionSheet : WHEBaseApi

// 按钮的文字数组，数组长度最大为6个
@property (nonatomic, copy) NSArray<NSString *> *itemList;

// 按钮的文字颜色，默认为"#000000"
@property (nonatomic, copy) NSString *itemColor;

@end
