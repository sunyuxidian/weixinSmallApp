//
//  WHE_makePhoneCall.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_makePhoneCall.h"
#import <UIKit/UIKit.h>

@implementation WHE_makePhoneCall

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.phoneNumber]];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:phoneURL])
    {
        if ([app respondsToSelector:@selector(openURL:completionHandler:)]) {
            [app openURL:phoneURL options:@{} completionHandler:^(BOOL succ) {
                if(succ) {
                    if (success) {
                        success(@{});
                    }
                } else {
                    if (failure) {
                        failure(@{});
                    }
                }
            }];
        } else {
            [[UIApplication sharedApplication] openURL:phoneURL];
            if (success) {
                success(@{});
            }
        }

    }else {
        if (failure) {
            failure(nil);
        }
    }
}

@end
