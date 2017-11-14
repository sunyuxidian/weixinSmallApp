//
//  WHE_vibrateShort.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/22.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_vibrateShort.h"
#import <AVFoundation/AVFoundation.h>

@implementation WHE_vibrateShort

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    AudioServicesPlaySystemSound(1520);
}

@end
