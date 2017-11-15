//
//  WHE_removeStorageSync.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_removeStorageSync.h"
#import "WHEStorageUtil.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"

@implementation WHE_removeStorageSync

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
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[WHEStorageUtil dictionaryWithFilePath:filePath]];
    if (![dic objectForKey:self.key]) {
        failure(@{@"errMsg": @"找不到key 对应的数据"});
    } else {
        [dic removeObjectForKey:self.key];
        [WHEStorageUtil saveDictionary:dic toPath:filePath];
    }
}

@end
