//
//  WDHUtils.h
//  WDHodoer
//
//  Created by acorld on 2017/7/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDHUtils : NSObject

+ (UIColor *)SMRGB:(unsigned int)rgbValue;
+ (UIColor *)SMRGBA:(unsigned int)rgbValue alpha:(float)alpha;

//颜色转换如字符串#c60a1e -> UIColor
+ (UIColor *) WH_Color_Conversion:(NSString *)Color_Value;

+ (CGSize)getTextSize:(NSString *)text font:(UIFont *)font;

+ (CGFloat) getTextHeight:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

+ (CGFloat) getTextWidth:(NSString *)text font:(UIFont *)font height:(CGFloat)height;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (UIImage *)imageFromColor:(UIColor *)color rect:(CGRect)rect;

@end
