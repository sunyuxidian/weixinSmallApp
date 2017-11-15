//
//  WHE_clearStorageSync.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_clearStorageSync.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"

@implementation WHE_clearStorageSync

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    // 获取当前用户storage文件
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
	NSString *storageDirPath = [WDHFileManager appStorageDirPath:app.appInfo.appId];
	NSString *userId = app.appInfo.userId;
	
    NSString *filePath = [NSString stringWithFormat:@"%@/storage_%@", storageDirPath, userId];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        if ([fileManager removeItemAtPath:filePath error:nil]) {
            success(@{@"errMsg": @"清理本地数据缓存成功"});
        } else {
            failure(@{@"errMsg": @"清理本地数据缓存失败"});
        }
    } else {
        success(@{@"errMsg": @"清理本地数据缓存成功"});
    }
}

@end
