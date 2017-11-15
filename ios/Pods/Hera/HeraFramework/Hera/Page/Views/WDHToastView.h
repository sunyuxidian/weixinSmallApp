//
//  WDHToastView.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDHToastView : UIView

+ (void) showInView:(UIView *)view text:(NSString *)text mask:(BOOL)mask duration:(int)duration;
+ (void) hideToast:(WDHToastView *)toast inView:(UIView *)inView;

@end
