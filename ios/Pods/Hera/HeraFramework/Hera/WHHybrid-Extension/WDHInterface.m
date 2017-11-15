//
//  WDHInterface.m
//  Hera
//
//  Created by WangYiqiao on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHInterface.h"
#import "WDHApp.h"
#import "WDHFileManager.h"

@implementation WDHInterface

+ (instancetype)sharedInterface {
	
	static WDHInterface *shared = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		shared = [[WDHInterface alloc] init];
	});
	
	return shared;
}

#pragma mark - Private

- (BOOL)copyAppResource:(NSString *)path withAppId:(NSString *)appId {
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (!path || ![fileManager fileExistsAtPath:path]) {
		return NO;
	}
	
	NSURL *fileURL = [NSURL fileURLWithPath:path];
	NSURL *toURL = [NSURL fileURLWithPath:[WDHFileManager tempDownloadZipPath]];
	if ([fileManager copyItemAtURL:fileURL toURL:toURL error:nil]) {
		NSDictionary *dic = @{appId: @{@"appId": appId}};
		NSString *appInfoPath = [WDHFileManager tempDownloadZipInfoFilePath];
		return [dic writeToFile:appInfoPath atomically:YES];
	}
	
	return NO;
}

#pragma mark - Interface

- (void)startAppWithAppInfo:(WDHAppInfo *)appInfo entrance:(UINavigationController *)entrance completion:(void (^)(BOOL, NSString *))completion {
	
	if (!appInfo.appId || !appInfo.userId) {
		if (completion) {
			completion(NO, @"appId or userId is nil");
		}
		return;
	}
	
	//配置文件目录
	[WDHFileManager setupAppDir:appInfo.appId];

	// 拷贝外部资源文件
	BOOL copyResourceSuccess = NO;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (!appInfo.appPath || ![fileManager fileExistsAtPath:appInfo.appPath]) {
		NSString *resourcePath = [NSBundle.mainBundle pathForResource:appInfo.appId ofType:@"zip"];
		copyResourceSuccess = [self copyAppResource:resourcePath withAppId:appInfo.appId];
	} else {
		copyResourceSuccess = [self copyAppResource:appInfo.appPath withAppId:appInfo.appId];
	}

	if (!copyResourceSuccess) {
		if (completion) {
			completion(NO, @"copyResourceSuccess failed!");
		}
		return;
	}

	// 配置内部资源文件
	if ([WDHFileManager copyAppFile:appInfo.appId]) {
		NSString *serviceHtml = [WDHFileManager appServiceEnterencePath:appInfo.appId];
		if([[NSFileManager defaultManager] fileExistsAtPath:serviceHtml]) {

			WDHApp *app = [[WDHApp alloc] initWithAppInfo:appInfo];
			[app startAppWithEntrance:entrance];

			if (completion) {
				completion(YES, @"start app success!");
			}
		} else {
			if (completion) {
				completion(NO, @"service.html not found!");
			}
		}
	} else {
		if (completion) {
			completion(NO, @"copy app file failed!");
		}
	}
}

- (NSString *)sdkVersion {
	return @"1.0.0";
}

@end
