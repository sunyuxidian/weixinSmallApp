//
//  WHE_playVoice.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_playVoice.h"
#import "WHEMacro.h"
#import "WHEAVManager.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WHE_playVoice

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    if (!self.filePath) {
        failure(@{@"errMsg": @"参数filePath 不能为空"});
        return;
    }
    
    NSURL *fileUrl = nil;
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    if ([self.filePath hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"tmp_"]]) {
        NSString *fileName = [self getFileName:self.filePath];
        NSString *fileRealPath = [[WDHFileManager appTempDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
        fileUrl = [NSURL fileURLWithPath:fileRealPath];
    } else if ([self.filePath hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"store_"]]) {
        NSString *fileName = [self getFileName:self.filePath];
        NSString *fileRealPath = [[WDHFileManager appPersistentDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
        fileUrl = [NSURL fileURLWithPath:fileRealPath];
    } else {
        fileUrl = [NSURL URLWithString:self.filePath];
    }
    
    [[WHEAVManager sharedManager] startPlayVoice:fileUrl fail:^(NSString *errMsg) {
        failure(@{@"errMsg": errMsg});
    }];
}

- (NSString *)getFileName:(NSString *)filePath {
    NSRange range = [filePath rangeOfString: WDH_FILE_SCHEMA];
    NSString *fileName = [filePath substringFromIndex:NSMaxRange(range)];
    return fileName;
}

@end
