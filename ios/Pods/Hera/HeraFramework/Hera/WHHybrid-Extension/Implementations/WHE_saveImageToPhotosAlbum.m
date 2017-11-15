//
//  WHE_saveImageToPhotosAlbum.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/7/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "WHE_saveImageToPhotosAlbum.h"
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"
#import <UIKit/UIKit.h>

@implementation WHE_saveImageToPhotosAlbum

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel {

    NSString *filePath = self.filePath;
    if (!filePath) {
        failure(@{@"errMsg": @"参数filePath不合法"});
        return;
    }
	
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *fileRootPath = [WDHFileManager appTempDirPath:app.appInfo.appId];
    NSString *fileName = nil;
    
    if ([filePath hasPrefix: WDH_FILE_SCHEMA]) {
        NSRange range = [filePath rangeOfString: WDH_FILE_SCHEMA];
        fileName = [filePath substringFromIndex:NSMaxRange(range)];
    }
    
    NSString *localFilePath = [fileRootPath stringByAppendingPathComponent:fileName];
    UIImage *image = [UIImage imageWithContentsOfFile:localFilePath];
    
    if (!image) {
        failure(@{@"errMsg": @"图片不存在"});
        return;
    }

    __block ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    [lib writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            failure(@{@"errMsg": error.localizedDescription});
        } else {
            success(@{@"msg": @"保存图片到相册成功"});
        }
        
        lib = nil;
    }];
}

@end
