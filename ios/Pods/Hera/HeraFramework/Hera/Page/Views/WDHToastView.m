//
//  WDHToastView.m
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHToastView.h"
#import "WDHUtils.h"

@interface WDHToastView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, copy) NSString *text;

@end

@implementation WDHToastView

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    [[UIColor colorWithWhite:0 alpha:0.8] set];
    [path fill];
}

+ (UIFont *)kTextFont
{
    return [UIFont systemFontOfSize:12];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _label = [UILabel new];
        _label.font = [WDHToastView kTextFont];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        //icon 待定
        //        iconView = UIImageView()
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
    }
    
    return self;
}

- (void) layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    self.label.frame = (CGRect){10,10,w-20,h-20};
}

+ (void) showInView:(UIView *)view text:(NSString *)text mask:(BOOL)mask duration:(int)duration {
    
    CGFloat maxWidth = view.frame.size.width * 0.75;
    
    CGFloat width = [WDHUtils getTextSize:text font:[WDHToastView kTextFont]].width + 30;
    CGFloat w = width;
    
    if (width > maxWidth) {
        w = maxWidth;
    }
    CGFloat h = [WDHUtils getTextHeight:text font:[WDHToastView kTextFont] width:w] + 30;
    
    CGFloat left = (view.frame.size.width - w)/2;
    left = (CGFloat)(ceilf((CGFloat)left));
    
    CGFloat top = (view.frame.size.height - h)/2;
    top = (CGFloat)(ceilf((CGFloat)top));
    
    if (mask) {
        view.userInteractionEnabled = mask;
    }
    
    WDHToastView *toast = [[WDHToastView alloc] initWithFrame:(CGRect){left,top,w,h}];
    toast.text = text;
    [view addSubview:toast];
    toast.alpha = 0;
    [UIView animateWithDuration:0.15 animations:^{
        toast.alpha = 1;
    } completion:^(BOOL finished) {
        CGFloat sec = (float)duration / 1000;
        
        __weak typeof(self) weak_self = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weak_self hideToast:toast inView:view];
        });

    }];

}

+ (void) hideToast:(WDHToastView *)toast inView:(UIView *)inView {
    [UIView animateWithDuration:0.15 animations:^{
        toast.alpha = 0;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
    }];

    inView.userInteractionEnabled = true;
}

@end
