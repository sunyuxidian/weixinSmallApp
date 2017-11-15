//
//  WHE_setStorageSync.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/3.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_setStorageSync.h"
#import "WHEMacro.h"
#import "WHEStorageUtil.h"
#import "WDHAppInfo.h"
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHFileManager.h"

@implementation WHE_setStorageSync

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    // 避免Number类型被转换为String类型
    id data = self.param[@"data"];
    
    if (!self.key || !data) {
        failure(@{@"errMsg": @"参数不能为空"});
        return;
    }
    
	// 获取storage目录
	NSFileManager *fileManager = [NSFileManager defaultManager];
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
	NSString *storageDirPath = [WDHFileManager appStorageDirPath:app.appInfo.appId];
	if (![fileManager fileExistsAtPath:storageDirPath]) {
		[fileManager createDirectoryAtPath:storageDirPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	// localStorage 以用户维度隔离
	NSString *userId = app.appInfo.userId;
	NSString *filePath = [NSString stringWithFormat:@"%@/storage_%@", storageDirPath, userId];
	
    // 检查是否超出本地存储空间限制
    if ([fileManager fileExistsAtPath:filePath]) {
        NSDictionary *fileAttribues = [fileManager attributesOfItemAtPath:filePath error:nil];
        UInt64 fileSize = fileAttribues.fileSize;
        UInt64 currentSize = [WHEStorageUtil dataWithDictionary:@{self.key: data}].length;
        if (fileSize + currentSize > STORAGE_LIMIT_SIZE) {
            failure(@{@"errMsg": @"本地存储空间超出限制"});
            return;
        }
    }
    
    // 获取当前的storage
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[WHEStorageUtil dictionaryWithFilePath:filePath]];
    dic[self.key] = data;
    
    if ([WHEStorageUtil saveDictionary:dic toPath:filePath]) {
        success(@{@"errMsg": @"存储数据成功"});
    } else {
        failure(@{@"errMsg": @"存储数据失败"});
    }
    
}

@end
