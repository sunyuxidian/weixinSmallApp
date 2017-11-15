//
//  WHE_stopRecord.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_stopRecord.h"
#import "WHEAVManager.h"

@implementation WHE_stopRecord

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    [[WHEAVManager sharedManager] stopRecord];
}

@end
