//
//  WHE_startRecord.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_startRecord.h"
#import "WHEAVManager.h"

@implementation WHE_startRecord

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    [[WHEAVManager sharedManager] startRecordWithSuccess:^(NSString *tempFilePath) {
        success(@{@"tempFilePath": tempFilePath});
    } fail:^(NSString *msg) {
        failure(@{@"errMsg": msg});
    }];
}

@end
