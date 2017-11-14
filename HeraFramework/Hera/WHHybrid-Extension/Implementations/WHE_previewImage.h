//
//  WHE_previewImage.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_previewImage : WHEBaseApi

/// 当前显示图片的链接，不填则默认为 urls 的第一张
@property (nonatomic, copy) NSString *current;

/// 需要预览的图片链接列表
@property (nonatomic, strong) NSArray <NSString *> *urls;

@end
