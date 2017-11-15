//
//  WDHBaseViewController.h
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/27.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHNavigationView.h"
#import "WDHPageModel.h"

@interface WDHBaseViewController : UIViewController

@property (nonatomic, strong) WDHNavigationView *naviView;

@property (nonatomic, strong) WDHPageModel *pageModel;

/**
 内存清理
 */
- (void)cleanMemory;

/**
 展示一个Toast
 
 @param mask 是否允许UserInteraction
 */
- (void)showToast:(NSString *)text mask:(BOOL)mask duration:(int)duration;

/**
 展示一个Loading

 @param mask 是否允许UserInteraction
 */
- (void)startLoading:(NSString *)text mask:(BOOL)mask;

/**
 停止Loading
 */
- (void)stopLoading;

/**
 停止下拉刷新
 */
- (void)stopPullDownRefresh;

/**
 开始下拉刷新
 */
- (void)startPullDownRefresh;

/**
 开启NavigationBar Loading
 */
- (void)startNaviLoading;

/**
 停止NavigationBar Loading
 */
- (void)hideNaviLoading;

/**
 设置NavigationBar的颜色
 
 @param frontColor 前景颜色值，包括按钮、标题、状态栏的颜色，仅支持 #ffffff 和 #000000
 @param bgColor 背景颜色值，有效值为十六进制颜色
 @param param 动画效果
 */
- (void)setNaviFrontColor:(NSString *)frontColor andBgColor:(NSString *)bgColor withAnimationParam:(NSDictionary *)param;


@end
