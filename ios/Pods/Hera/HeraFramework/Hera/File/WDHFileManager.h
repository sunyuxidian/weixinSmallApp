//
//  WDHFileManager.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDHFileManager : NSObject

+ (BOOL)removePath:(NSString *)path;

+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath;

+ (void)cleanDownloadZipDir;

+ (NSString *)frameworkRootPath;

+ (NSString *)tempDownloadZipPath;

+ (NSString *)tempDownloadZipInfoFilePath;

+ (NSString *)projectRootAppsDirPath;

+ (NSDictionary *)getCachedAppList;

+ (UInt64)getCachedSize;

/**
 配置小程序文件目录
 */
+ (void)setupAppDir:(NSString *)appId;

/**
 拷贝小程序的资源文件
 */
+ (BOOL)copyAppFile:(NSString *)appId;

/**
 获取小程序入口文件
 */
+ (NSString *)appServiceEnterencePath:(NSString *)appId;

/**
 获取当前小程序根目录
 */
+ (NSString *)appRootDirPath:(NSString *)appId;

/**
 获取当前小程序根源码目录
 */
+ (NSString *)appSourceDirPath:(NSString *)appId;

/**
 获取当前小程序临时存储目录
 */
+ (NSString *)appTempDirPath:(NSString *)appId;

/**
 获取当前小程序持久化存储目录
 */
+ (NSString *)appPersistentDirPath:(NSString *)appId;

/**
 获取当前小程序本地存储数据目录
 */
+ (NSString *)appStorageDirPath:(NSString *)appId;

@end
