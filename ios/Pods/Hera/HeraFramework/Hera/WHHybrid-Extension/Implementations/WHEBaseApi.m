//
//  WHEBaseApi.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@implementation WHEBaseApi

- (void)setupWithCompletion:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))completion
{
    //默认实现，子类重写！！！
    if (completion) {
        completion(@{});
    }
}

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    //默认实现，子类重写！！！
    if (cancel) {
        cancel();
    }
    
    if (success) {
        success(@{});
    }
    
    if (failure) {
        failure(nil);
    }
}

@end
