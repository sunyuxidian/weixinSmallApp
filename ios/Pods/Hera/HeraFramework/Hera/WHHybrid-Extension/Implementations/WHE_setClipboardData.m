//
//  WHE_setClipboardData.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_setClipboardData.h"
#import <UIKit/UIKit.h>

@implementation WHE_setClipboardData

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    if (!self.data) {
        failure(@{@"errMsg": @"参数data为空"});
        return;
    }
    
    [UIPasteboard generalPasteboard].string = self.data;
    
    success(@{@"data": self.data});
}

@end
