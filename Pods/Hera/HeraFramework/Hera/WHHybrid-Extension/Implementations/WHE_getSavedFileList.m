//
//  WHE_getSavedFileList.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getSavedFileList.h"
#import "WHEMacro.h"
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WHE_getSavedFileList

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    // 获取本地文件目录 persistent
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *persistentDir = [WDHFileManager appPersistentDirPath:app.appInfo.appId];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:persistentDir];
    
    // 获取文件列表信息
    NSMutableArray *infoArr = [NSMutableArray array];
    NSString *fileName;
    while (fileName = [enumerator nextObject]) {
        NSString *filePath = [NSString stringWithFormat:@"%@%@", WDH_FILE_SCHEMA, fileName];
        NSDate *createTime = enumerator.fileAttributes.fileCreationDate;
        UInt64 size = enumerator.fileAttributes.fileSize;
        [infoArr addObject:@{@"filePath": filePath, @"createTime": @(createTime.timeIntervalSince1970), @"size": @(size)}];
    }
    
    success(@{@"errMsg": @"获取本地文件列表成功", @"fileList": infoArr});
}

@end
