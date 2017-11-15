//
//  WDHApi.m
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHApi.h"
#import "NSObject+WDHJson.h"
#import "WDHApiRequest.h"

@implementation WDHApi

- (void)callAPIWithCommand:(NSString *)command param:(NSString *)param callback:(WDHApiRequestCallback)callback
{
    NSDictionary *paramDic = [param wdh_jsonObject];
    WDHApiRequest *request = [[WDHApiRequest alloc] init];
    request.command = command;
    request.param = paramDic;
    request.callback = ^(NSDictionary<NSString *,NSObject *> *result) {
        if (callback) {
            callback(result);
        }
    };
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didRecieveHybridApiWithApi:)]) {
        [self.delegate didRecieveHybridApiWithApi:request];
    }
}

@end
