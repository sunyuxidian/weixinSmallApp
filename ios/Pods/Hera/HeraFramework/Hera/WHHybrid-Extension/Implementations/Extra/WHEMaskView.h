//
//  WHEMaskView.h
//  TestScan
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 WangYiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHEMaskView : UIView

+ (void)showMaskInView:(UIView *)view withTitle:(NSString *)title message:(NSString *)message;

+ (void)hideMaskViewInView:(UIView *)view;

@end
