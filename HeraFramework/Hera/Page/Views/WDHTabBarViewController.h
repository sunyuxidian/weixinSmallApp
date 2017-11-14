//
//  WDHTabBarViewController.h
//  WDHodoer
//
//  Created by acorld on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHPageModel.h"
#import "WDHPageManagerProtocol.h"
#import "WDHBaseViewController.h"

@interface WDHTabBarViewController : WDHBaseViewController

/// 上次显示的tab item controller
@property (nonatomic, weak) WDHPageBaseViewController *currentController;

@property (nonatomic, strong) WDHTabbarStyle *tabbarStyle;

/// controllers
@property (nonatomic, strong) NSArray *viewControllers;

@property (nonatomic, weak) id <WDHPageManagerProtocol> pageManager;

- (void)switchTabBar:(NSString *)pagePath;


@end
