//
//  WHE_getStorageSync.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getStorageSync.h"
#import "WHHybridExtension.h"
#import "WHEStorageUtil.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"

@implementation WHE_getStorageSync

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    if (!self.key) {
        failure(@{@"errMsg": @"参数key为空"});
        return;
    }
    
    // 获取当前用户storage文件
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *storageDirPath = [WDHFileManager appStorageDirPath:app.appInfo.appId];
    NSString *userId = app.appInfo.userId;
    NSString *filePath = [NSString stringWithFormat:@"%@/storage_%@", storageDirPath, userId];
    
    NSDictionary *dic = [WHEStorageUtil dictionaryWithFilePath:filePath];
    id data = [dic objectForKey:self.key];
    
    if (data) {
        NSString *dataType = nil;
        if ([data isKindOfClass:NSNumber.class]) {
            dataType = @"Number";
        } else if ([data isKindOfClass:NSString.class]) {
            dataType = @"String";
        } else if ([data isKindOfClass:NSDictionary.class]) {
            dataType = @"Dictionary";
        } else if ([data isKindOfClass:NSArray.class]) {
            dataType = @"Array";
        } else if ([data isKindOfClass:NSDate.class]) {
            dataType = @"Date";
        } else {
            dataType = @"Undefined";
        }
        
        success(@{@"data": data, @"dataType": dataType});
    } else {
        failure(@{@"errMsg": @"找不到key 对应的数据"});
    }
    
}

@end
