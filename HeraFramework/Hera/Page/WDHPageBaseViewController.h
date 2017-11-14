//
//  WDHPageBaseViewController.h
//  WDHodoer
//
//  Created by acorld on 2017/7/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
//#import "WDHPageModel.h"
#import "WDHPageManagerProtocol.h"
#import "WDHBaseViewController.h"

@interface WDHPageBaseViewController : WDHBaseViewController

//@property (nonatomic, strong) WDHPageModel *pageModel;

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) id <WDHPageBridgeJSProtocol> bridge;

@property (nonatomic, weak) id <WDHPageManagerProtocol> pageManager;

@property (nonatomic, assign) BOOL isTabBarVC;

- (void)loadData;

- (void)loadStyle;

@end
