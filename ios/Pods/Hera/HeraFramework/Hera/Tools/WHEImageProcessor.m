//
//  WHEImageProcessor.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEImageProcessor.h"

@implementation WHEImageProcessor

#pragma mark - scale
#pragma mark -

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
+ (UIImage *)scaleImageByOriginalProportion:(UIImage *)image width:(CGFloat)width
{
    if (image.size.width < width) {
        return image;
    }
    else {
        CGSize newSize;
        newSize.width  = width;
        newSize.height = (image.size.height * width) / image.size.width;
        newSize.height = floorf(newSize.height);
        
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
#ifdef DEBUG
        NSLog(@"原图片width = %f height = %f scale = %f", image.size.width, image.size.height, image.size.width / image.size.height);
        NSLog(@"新图片width = %f height = %f scale = %f", newSize.width, newSize.height, newSize.width/newSize.height);
#endif
        
        return scaledImage;
    }
}


@end
