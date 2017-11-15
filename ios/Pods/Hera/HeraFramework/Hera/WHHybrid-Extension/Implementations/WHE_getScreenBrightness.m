//
//  WHE_getScreenBrightness.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getScreenBrightness.h"
#import <UIKit/UIKit.h>

@implementation WHE_getScreenBrightness

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    CGFloat brightness = [[UIScreen mainScreen] brightness];
    
    success(@{@"value": @(brightness)});
}

@end
