//
//  WDHManager.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHService.h"
#import "WDHPageManager.h"
#import "WDHPageApi.h"
#import "WDHApi.h"
#import "WDHManagerProtocol.h"
#import "WHHybridExtension.h"


@interface WDHManager : NSObject<WDHManagerProtocol>

@property (nonatomic, strong) WDHService *service;

@property (nonatomic, strong) WHHybridExtension *extensionApi;

@property (nonatomic, strong) WDHPageManager *pageManager;

@property (nonatomic, strong) WDHPageApi *pageApi;

- (void)setupEntrance:(UINavigationController *)controller;

- (instancetype)initWithAppInfo:(WDHAppInfo *)appInfo;

@end
