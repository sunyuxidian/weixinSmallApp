//
//  WHE_saveFile.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_saveFile.h"
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"
#import "WHECryptUtil.h"

@implementation WHE_saveFile

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    if (!self.tempFilePath) {
        failure(@{@"errMsg": @"参数tempFilePath为空"});
        return;
    }
    
    NSString *tempfileName = nil;
    if ([self.tempFilePath hasPrefix: WDH_FILE_SCHEMA]) {
        NSRange range = [self.tempFilePath rangeOfString: WDH_FILE_SCHEMA];
        tempfileName = [self.tempFilePath substringFromIndex:NSMaxRange(range)];
    } else {
        tempfileName = self.tempFilePath;
    }
	
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *cacheDir = [WDHFileManager appTempDirPath:app.appInfo.userId];
    NSString *fileRealPath = [cacheDir stringByAppendingPathComponent:tempfileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fileRealPath]) {
        failure(@{@"errMsg": @"文件不存在"});
        return;
    }
    
    NSData *fileData = [[NSData alloc] initWithContentsOfFile:fileRealPath];
    
    // 获取长期存储文件夹目录
    NSString *persistentDir = [WDHFileManager appPersistentDirPath:app.appInfo.appId];
    if (![fileManager fileExistsAtPath:persistentDir]) {
        [fileManager createDirectoryAtPath:persistentDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    // 获取当前存储文件大小 限制存储空间
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:persistentDir];
    UInt64 fileSize = 0;
    while ([enumerator nextObject]) {
        fileSize += enumerator.fileAttributes.fileSize;
    }
    
    if (fileData.length + fileSize > FILE_LIMIT_SIZE) {
        NSString *errMsg = [NSString stringWithFormat:@"本地存储空间超出%dMB大小的限制", FILE_LIMIT_SIZE / 1024 / 1024];
        failure(@{@"errMsg": errMsg});
        return;
    }
    
    // 获取文件扩展名
    NSString *fileExtension = nil;
    NSRange range = [tempfileName rangeOfString:@"." options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        fileExtension = [tempfileName substringFromIndex:NSMaxRange(range)];
    } else {
        fileExtension = @"";
    }

    // 写入持久化文件
    NSString *fileMD5 = [WHECryptUtil md5WithBytes:(char *)fileData.bytes length:fileData.length];
    NSString *fileName = [NSString stringWithFormat:@"store_%@.%@", fileMD5, fileExtension];
    NSString *persistentPath = [persistentDir stringByAppendingPathComponent:fileName];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([fileManager createFileAtPath:persistentPath contents:fileData attributes:nil]) {
            success(@{@"savedFilePath": [NSString stringWithFormat:@"%@%@", WDH_FILE_SCHEMA, fileName]});
        } else {
            failure(@{@"errMsg": @"保存文件失败"});
        }
    });
}

@end
