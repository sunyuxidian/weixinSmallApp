//
//  WHE_getClipboardData.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getClipboardData.h"
#import <UIKit/UIKit.h>

@implementation WHE_getClipboardData

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    NSString *data = [UIPasteboard generalPasteboard].string;
    
    success(@{@"data": data == nil ? @"" : data});
}

@end
