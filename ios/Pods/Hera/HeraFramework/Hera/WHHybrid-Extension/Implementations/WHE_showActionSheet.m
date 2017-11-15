//
//  WHE_showActionSheet.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_showActionSheet.h"
#import <UIKit/UIKit.h>
#import "WDHUtils.h"
#import <Hera/WDHodoer.h>

@implementation WHE_showActionSheet

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    if (!self.itemList || self.itemList.count <= 0 || self.itemList.count > 6) {
        failure(@{@"errMsg": @"参数itemList不合法"});
        return;
    }
    
    // 如果参数不合法 设为默认值"#000000"
    if (!self.itemColor || self.itemColor.length != 7) {
        self.itemColor = @"#000000";
    }

    UIAlertController *alertCtrl = [[UIAlertController alloc] init];
    [self.itemList enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            success(@{@"tapIndex": @(idx)});
        }];
        
        [action setValue:[WDHUtils WH_Color_Conversion:self.itemColor] forKey:@"titleTextColor"];
        [alertCtrl addAction:action];
    }];
    
    // 添加取消action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        failure(@{@"errMsg": @"showActionSheet:fail cancel"});
    }];
    [alertCtrl addAction:cancelAction];
    
    UIWindow *wid = [UIApplication sharedApplication].keyWindow;
    [wid.rootViewController presentViewController:alertCtrl animated:YES completion:nil];
}

@end
