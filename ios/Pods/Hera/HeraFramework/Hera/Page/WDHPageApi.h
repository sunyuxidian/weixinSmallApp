//
//  WDHPageApi.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHApiRequest.h"

@class WDHService;
@class WDHPageManager;
@interface WDHPageApi : NSObject


@property (nonatomic, weak) WDHService *service;

@property (nonatomic, copy) NSString *basePath;

- (instancetype)initWithPageManager:(WDHPageManager *)pageManager;
- (void) receive:(NSString *)command param:(NSDictionary *)param callback:(WDHApiRequestCallback)callback;

@end
