//
//  WHE_getImageInfo.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_getImageInfo.h"
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"
#import <UIKit/UIKit.h>

@implementation WHE_getImageInfo

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    NSString *filePath = self.src;
    if (!filePath) {
        if (failure) {
            failure(@{@"error":@"字段不齐全!"});
        }
        
        return;
    }
    
    NSURL *fileURL = [NSURL URLWithString:filePath];
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *fileRootPath = [WDHFileManager appTempDirPath:app.appInfo.appId];
    NSString *fileName = fileURL.lastPathComponent;
    NSString *localFilePath = [fileRootPath stringByAppendingPathComponent:fileName];
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:localFilePath];
    
    if (!image) {
        if (failure) {
            failure(@{@"error":@"本地图片不存在！"});
        }
        return;
    }
    
    CGSize size = image.size;
    
    if (success) {
        success(@{@"width":[NSString stringWithFormat:@"%@",@(size.width)],@"height":[NSString stringWithFormat:@"%@",@(size.height)],@"path":localFilePath});
    }
}

@end
