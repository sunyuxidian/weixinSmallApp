//
//  WHE_scanCode.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/9.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_scanCode.h"
#import "WHECommonUtil.h"
#import "WHEScanViewController.h"

@implementation WHE_scanCode

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    __block WHEScanViewController *scanVC = [[WHEScanViewController alloc] init];
    scanVC.isOnlyFromCamera = self.onlyFromCamera;
    
    scanVC.completionBlock = ^(NSString *result, NSString *scanType) {
        [scanVC.navigationController popViewControllerAnimated:YES];
        
        success(@{@"result": result, @"scanType": scanType, @"charSet": @"Unicode"});
        
        scanVC = nil;
    };
    
    [[WHECommonUtil currentNavigationController] pushViewController:scanVC animated:YES];
}

@end
