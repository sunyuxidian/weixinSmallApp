//
//  WHE_setKeepScreenOn.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_setKeepScreenOn.h"
#import <UIKit/UIKit.h>

@implementation WHE_setKeepScreenOn

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:self.keepScreenOn];
    
    success(@{@"errMsg": @"设置成功"});
}

@end
