//
//  WHEMaskView.m
//  TestScan
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 WangYiqiao. All rights reserved.
//

#import "WHEMaskView.h"

#define kWHEMaskView_Tag 1003

@interface WHEMaskView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation WHEMaskView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.titleLabel.frame = CGRectMake(0, (height - 21) / 2, width, 21);
    
    CGFloat detailY = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 8;
    self.detailLabel.frame = CGRectMake(0, detailY, width, 21);
}

#pragma mark - Setup

- (void)setupViews {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = UIColor.whiteColor;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.font = [UIFont systemFontOfSize:13];
    _detailLabel.textColor = UIColor.lightGrayColor;
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_detailLabel];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *recg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnView)];
    [self addGestureRecognizer:recg];
    self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.8];
}

#pragma mark - User Interaction

- (void)tappedOnView {
    [self removeFromSuperview];
}

#pragma mark - Public

+ (void)showMaskInView:(UIView *)view withTitle:(NSString *)title message:(NSString *)message {
    WHEMaskView *maskView = [[WHEMaskView alloc] initWithFrame:view.frame];
    maskView.tag = kWHEMaskView_Tag;
    maskView.titleLabel.text = title;
    maskView.detailLabel.text = message;
    
    [view addSubview:maskView];
}

+ (void)hideMaskViewInView:(UIView *)view {
    UIView *maskView = [view viewWithTag:kWHEMaskView_Tag];
    if (maskView) {
        [maskView removeFromSuperview];
    }
}

@end
