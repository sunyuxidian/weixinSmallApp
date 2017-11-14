//
//  WHE_downloadFile.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/25.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_downloadFile.h"
#import "WHECryptUtil.h"
#import "WHEMacro.h"
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"

@implementation WHE_downloadFile

- (void)setupApiWithSuccess:(void (^)(NSDictionary<NSString *,id> * _Nonnull))success failure:(void (^)(id _Nullable))failure cancel:(void (^)(void))cancel
{
    NSString *urlString = self.url;
    
    NSDictionary *header = self.header;
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Set Header
    [header enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        [request setValue:obj forHTTPHeaderField:key];
    }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    // 由于要先对request先行处理,我们通过request初始化task
    NSURLSessionTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            if (data) {
												WDHApp *app = [[WDHAppManager sharedManager] currentApp];
                                                NSString *tempDir = [WDHFileManager appTempDirPath:app.appInfo.appId];
                                                if (![[NSFileManager defaultManager] fileExistsAtPath:tempDir]) {
                                                    [[NSFileManager defaultManager] createDirectoryAtPath:tempDir withIntermediateDirectories:YES attributes:nil error:nil];
                                                }
                                                
                                                NSString *fileMD5 = [WHECryptUtil md5WithBytes:(char *)[data bytes] length:[data length]];
                                                NSString *originalImageName = [NSString stringWithFormat:@"tmp_%@.jpg",fileMD5];
                                                NSString *originalImagePath = [tempDir stringByAppendingString:originalImageName];
                                                if ([data writeToFile:originalImagePath atomically:YES]) {
                                                    if (success) {
                                                        success(@{@"tempFilePath":[NSString stringWithFormat:@"%@%@",WDH_FILE_SCHEMA, originalImageName]});
                                                    }
                                                }else {
                                                    if (failure) {
                                                        failure(@{@"error":@"文件保存失败"});
                                                    }
                                                }
                                            }else
                                            {
                                                if (error.code == NSURLErrorCancelled) {
                                                    if (cancel) {
                                                        cancel();
                                                    }
                                                }else {
                                                    if (failure) {
                                                        failure(@{@"error":error.localizedDescription});
                                                    }
                                                }
                                            }
                                        }];
    [task resume];
}

@end
