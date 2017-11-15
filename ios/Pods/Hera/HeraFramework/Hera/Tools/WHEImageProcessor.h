//
//  WHEImageProcessor.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WHEImageProcessor : NSObject

/******************************************
 *
 * 按照图片的原始比例，根据指定的图片宽度缩放图片
 *
 * @param image 图片
 * @param width 指定的图片宽度
 *
 * @return 压缩后的图片
 *
 *****************************************/
+ (UIImage *)scaleImageByOriginalProportion:(UIImage *)image width:(CGFloat)width;

@end
