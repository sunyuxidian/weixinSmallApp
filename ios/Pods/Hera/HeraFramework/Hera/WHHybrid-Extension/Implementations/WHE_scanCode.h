//
//  WHE_scanCode.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 调起客户端扫码界面，扫码成功后返回对应的结果
 */
@interface WHE_scanCode : WHEBaseApi

/// 是否只能从相机扫码，不允许从相册选择图片 默认否
@property (nonatomic, assign) BOOL onlyFromCamera;

@end
