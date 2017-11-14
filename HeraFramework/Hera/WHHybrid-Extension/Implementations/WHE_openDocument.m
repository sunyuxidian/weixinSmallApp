//
//  WHE_openDocument.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/1.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_openDocument.h"
#import "WDDocumentPreviewController.h"
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WHE_openDocument

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {
    
    if (!self.filePath) {
        failure(@{@"errMsg": @"参数filePath为空"});
        return;
    }
    
    // 判断临时文件或者持久化文件
    NSString *fileRealPath = nil;
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    if ([self.filePath hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"tmp_"]]) {
        NSString *fileName = [self getFileName:self.filePath];
        fileRealPath = [[WDHFileManager appTempDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
    } else if ([self.filePath hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"store_"]]) {
        NSString *fileName = [self getFileName:self.filePath];
        fileRealPath = [[WDHFileManager appPersistentDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
    } else {
        failure(@{@"errMsg": @"文件路径错误"});
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fileRealPath]) {
        failure(@{@"errMsg": @"文件不存在"});
        return;
    }

    NSURL *fileUrl = [NSURL fileURLWithPath:fileRealPath];
    WDDocumentPreviewController *documentVC = [[WDDocumentPreviewController alloc] initWithUrl:fileUrl];
    UINavigationController *nvi = [[UINavigationController alloc] initWithRootViewController:documentVC];
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC presentViewController:nvi animated:YES completion:nil];
}

- (NSString *)getFileName:(NSString *)filePath {
    
    NSRange range = [filePath rangeOfString: WDH_FILE_SCHEMA];
    NSString *fileName = [filePath substringFromIndex:NSMaxRange(range)];
    
    return fileName;
}

@end
