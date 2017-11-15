//
//  WDHNavigationView.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDHNavigationView;
typedef void(^ButtonClickBlock)(WDHNavigationView *navigationView);

@interface WDHNavigationView : UIView

@property (nonatomic, copy) ButtonClickBlock leftClick;
@property (nonatomic, copy) ButtonClickBlock rightClick;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)startLoadingAnimation;

- (void)hideLoadingAnimation;

- (void)setNaviFrontColor:(NSString *)frontColor andBgColor:(NSString *)bgColor withAnimationParam:(NSDictionary *)param;


@end
