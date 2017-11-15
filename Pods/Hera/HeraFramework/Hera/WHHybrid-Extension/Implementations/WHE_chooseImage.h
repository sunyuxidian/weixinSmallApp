//
//  WHE_chooseImage.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_chooseImage : WHEBaseApi

/// 最多可以选择的图片张数，默认9
@property (nonatomic, copy) NSString *count;

/// original 原图，compressed 压缩图，默认二者都有
@property (nonatomic, strong) NSArray *sizeType;

/// album 从相册选图，camera 使用相机，默认二者都有
@property (nonatomic, strong) NSArray *sourceType;


@end
