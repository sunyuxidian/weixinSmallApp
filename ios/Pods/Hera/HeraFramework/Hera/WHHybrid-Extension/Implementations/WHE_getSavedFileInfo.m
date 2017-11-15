//
//  WHE_getSavedFileInfo.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getSavedFileInfo.h"
#import "WHEMacro.h"
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WHE_getSavedFileInfo

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    if (!self.filePath) {
        failure(@{@"errMsg": @"参数filePath为空"});
        return;
    }

    NSString *fileName = nil;
    if ([self.filePath hasPrefix:WDH_FILE_SCHEMA]) {
        NSRange range = [self.filePath rangeOfString:WDH_FILE_SCHEMA];
        fileName = [self.filePath substringFromIndex:NSMaxRange(range)];
    } else {
        fileName = self.filePath;
    }
    
    // 获取真实路径
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *persistDir = [WDHFileManager appPersistentDirPath:app.appInfo.appId];
    NSString *fileRealPath = [persistDir stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fileRealPath]) {
        failure(@{@"errMsg": @"文件不存在"});
        return;
    }
    
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:fileRealPath error:nil];
    UInt64 fileSize = fileAttributes.fileSize;
    NSDate *createDt = fileAttributes.fileCreationDate;
    
    success(@{@"errMsg": @"获取文件信息成功", @"size": @(fileSize), @"createTime": @(createDt.timeIntervalSince1970)});
}

@end
