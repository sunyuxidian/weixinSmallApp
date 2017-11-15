//
//  WHE_vibrateLong.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/22.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_vibrateLong.h"
#import <AVFoundation/AVFoundation.h>

@implementation WHE_vibrateLong

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
