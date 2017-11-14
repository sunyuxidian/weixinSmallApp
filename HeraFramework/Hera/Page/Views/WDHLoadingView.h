//
//  WDHLoadingView.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDHLoadingView : UIView

/**
 显示Loading层
 
 @param view 指定页面
 @param text 文本
 @param mask YES:允许交互 NO:禁止交互
 */
+ (void) showInView:(UIView *)view text:(NSString *)text mask:(BOOL)mask;

/**
 隐藏指定页面的Loading层

 @param view 待移除的页面
 */
+ (void) hideInView:(UIView *)view;

+ (void) stopAnimationInView:(UIView *)view;

+ (void) startAnimationInView:(UIView *)view;

/**
 移除所有Loding
 */
+ (void)removeAllLoading;

@end
