//
//  WDHTabBar.h
//  WDHodoer
//
//  Created by acorld on 2017/7/26.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WDHTabBarPositionStyle) {
    WDHTabBarStyleBottom,
    WDHTabBarStyleTop
};

@interface WDHTabBar : NSObject

@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *selectedColor;
@property (nonatomic, copy) NSString *backgroundColor;

@property (nonatomic, copy) NSString *borderStyle;

/// 适配器真实对象
@property (nonatomic, readonly, strong) UIView *wdh_view;

//tabbar的位置，可选值 bottom、top，默认bottom
@property (nonatomic,readonly, assign) WDHTabBarPositionStyle positionStyle;

- (UIView *)generateWDHTabbarWithPoistion:(NSString *)position;

- (void)configTabbarItemList:(NSArray *)list;

- (void)selectItemAtIndex:(NSUInteger)itemIndex;
- (void)didTapItem:(void(^)(NSString *pagePath,NSUInteger pageIndex))itemBlock;
- (void)didInitDefaultItem:(void(^)(NSString *pagePath,NSUInteger pageIndex))itemBlock;
- (void)showDefaultTabarItem;

@end
