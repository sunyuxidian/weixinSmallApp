//
//  WHE_setScreenBrightness.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_setScreenBrightness.h"
#import <UIKit/UIKit.h>

@implementation WHE_setScreenBrightness

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    if (!self.value || self.value.length <= 0) {
        failure(@{@"errMsg": @"参数value错误"});
        return;
    }
    
    float value = self.value.floatValue;
    
    if (value < 0 ) {
        value = 0;
    }
    
    if (value > 1) {
        value = 1;
    }
    
    [[UIScreen mainScreen] setBrightness:value];
}

@end
