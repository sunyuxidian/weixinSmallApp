//
//  WHE_getStorageInfoSync.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getStorageInfoSync.h"
#import "WHEMacro.h"
#import "WHEStorageUtil.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHAppManager.h"
#import "WDHFileManager.h"

@implementation WHE_getStorageInfoSync

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    // 获取当前用户storage文件
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *storageDirPath = [WDHFileManager appStorageDirPath:app.appInfo.appId];
    NSString *userId = app.appInfo.userId;
    NSString *filePath = [NSString stringWithFormat:@"%@/storage_%@", storageDirPath, userId];
    
    NSUInteger limitSize = STORAGE_LIMIT_SIZE / 1024;
    NSDictionary *dic = [WHEStorageUtil dictionaryWithFilePath:filePath];
    if (dic.count <= 0) {
        success(@{@"keys": dic.allKeys, @"currentSize": @0, @"limitSize": @(limitSize)});
    } else {
        // 获取当前存储大小 转换为KB 保留两位小数
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
        UInt64 fileSize = fileAttributes.fileSize;
        float currentSize = [[NSString stringWithFormat:@"%.2f", fileSize / 1024.0] floatValue];
        
        NSDictionary *dic = [WHEStorageUtil dictionaryWithFilePath:filePath];
        NSArray *keys = dic.allKeys;
        
        success(@{@"keys": keys, @"currentSize": @(currentSize), @"limitSize": @(limitSize)});
    }
}

@end
