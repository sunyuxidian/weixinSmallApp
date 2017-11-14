//
//  WHE_removeSavedFile.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_removeSavedFile.h"
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"

@implementation WHE_removeSavedFile

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

    if ([fileManager removeItemAtPath:fileRealPath error:nil] ) {
        success(@{@"msg": @"删除文件成功"});
    } else {
        failure(@{@"errMsg": @"删除文件失败"});
    }
}


@end
