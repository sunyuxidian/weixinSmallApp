//
//  WDHPageManager.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHManagerProtocol.h"
#import "WDHPageManagerProtocol.h"

@class WDHBaseViewController;
@class WDHPageBaseViewController;

@interface WDHPageStack : NSObject

@property (nonatomic, assign) NSUInteger initialIndex;

@property (nonatomic, strong) UINavigationController *naviController;

/**
 获取小程序栈顶控制器
 
 @return 小程序栈顶控制器
 */
- (WDHBaseViewController *)top;

/**
 获取小程序当前显示的页面

 @return 小程序当前显示的页面控制器
 */
- (WDHPageBaseViewController *)currentPage;

@end

/*
 被WHManager强持有，弱引用WHManager
 */
/// 页面管理者
@interface WDHPageManager : NSObject <WDHPageManagerProtocol>

@property (nonatomic, strong) WDHPageStack *pageStack;

@property (nonatomic, weak) id <WDHManagerProtocol> whManager;

/// config
@property (nonatomic, strong) NSDictionary *config;

- (void)startPage:(NSString *)basePath pagePath:(NSString *)pagePath isRoot:(BOOL)isRoot;

- (void)startPage:(NSString *)basePath pagePath:(NSString *)pagePath openNewPage:(BOOL)openNewPage;

- (void)startPage:(NSString *)basePath pagePath:(NSString *)pagePath isRoot:(BOOL)isRoot openNewPage:(BOOL)openNewPage;

- (void)startTabarPage:(NSDictionary *)config basePath:(NSString *)basePath defaultPagePath:(NSString *)defaultPagePath;

- (void)loadPageConfig:(unsigned long long)webId pageConfig:(NSDictionary *)pageConfig;

//- (void)callSubscribeHandler:(NSString *)eventName jsonParam:(NSString *)jsonParam webIds:(NSArray *)webIds;

- (NSUInteger)stackLength;

- (void)gotoPageAtIndex:(NSUInteger)existPageId ;

- (void)switchTabbar:(NSDictionary *)itemInfo;

- (void)setTopPageTitle:(NSString *)title;
- (void)activePageWillAppear:(WDHPageBaseViewController *)vc;
- (void)activePageDidDisappear:(WDHPageBaseViewController *)vc;
- (void)activePageDidAppear:(WDHPageBaseViewController *)vc;

- (void)setupWithNaviController:(UINavigationController *)naviController;

- (void)resetNavigationBarHidden;

@end
