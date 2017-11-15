//
//  WHE_getNetworkType.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getNetworkType.h"
#import "Reachability.h"

@implementation WHE_getNetworkType

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    NetworkStatus status = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    NSString *statusValue = @"";
    switch (status) {

        case NotReachable:
            statusValue = @"无网络";
            break;
        case ReachableViaWiFi:
            statusValue = @"wifi";
            break;
        case ReachableViaWWAN:
            statusValue = @"4g";
            break;
        default:
            statusValue = @"unknown";
            break;
    }
    
    if (success) {
        success(@{@"networkType":statusValue});
    }
}

@end
