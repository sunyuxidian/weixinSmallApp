//
//  WHE_pauseVoice.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_pauseVoice.h"
#import "WHEAVManager.h"

@implementation WHE_pauseVoice

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    [[WHEAVManager sharedManager] pauseVoice];
}

@end
