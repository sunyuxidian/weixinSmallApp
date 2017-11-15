//
//  WDHPageBridge.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHManagerProtocol.h"
#import "WDHPageBaseViewController.h"

@interface WDHPageBridge : NSObject<WDHPageBridgeJSProtocol>

@property (nonatomic, weak) id <WDHManagerProtocol> manager;
@property (nonatomic, weak) WDHPageBaseViewController *controller;

@end
