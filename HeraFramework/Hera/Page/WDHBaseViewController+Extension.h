//
//  WDHPageBaseViewController+Extension.h
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHBaseViewController.h"

@interface WDHBaseViewController(Extension)

- (void)track_open_page;

- (void)track_open_page_success;

- (void)track_open_page_failure:(NSString *)error;

- (void)track_close_page:(NSString *)pages;

- (void)track_page_ready;

- (void)track_renderContainer;

- (void)track_renderContainer_success;
- (void)track_renderContainer_failure:(NSString *)error;

@end
