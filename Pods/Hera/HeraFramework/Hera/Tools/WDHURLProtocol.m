//
//  WDHURLProtocol.m
//  TestWKWebView2
//
//  Created by WangYiqiao on 2017/8/18.
//  Copyright © 2017年 WangYiqiao. All rights reserved.
//

#import "WDHURLProtocol.h"
#import "WDHFileManager.h"
#import <UIKit/UIKit.h>
#import "WDHApp.h"
#import "WDHAppManager.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WDHURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    BOOL isWdfile = [request.URL.scheme isEqualToString:@"wdfile"];
	return isWdfile;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)startLoading {
    NSMutableURLRequest* request = self.request.mutableCopy;
	
    NSString *urlStr = request.URL.absoluteString;
    NSString *fileName = [self getFileName:urlStr];
    
    NSString *fileRealPath = nil;
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    if ([fileName hasPrefix:@"tmp_"]) {
        fileRealPath = [[WDHFileManager appTempDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
    } else if ([fileName hasPrefix:@"store_"]) {
        fileRealPath = [[WDHFileManager appPersistentDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
    } else {
        fileRealPath = fileName;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:fileRealPath];
    NSString *accept = [request valueForHTTPHeaderField:@"Accept"];
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:self.request.URL MIMEType:accept expectedContentLength:data.length textEncodingName:nil];
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    [self.client URLProtocol:self didLoadData:data];
    [self.client URLProtocolDidFinishLoading:self];
}

- (NSString *)getFileName:(NSString *)filePath {
    
    NSRange range = [filePath rangeOfString: @"wdfile://"];
    if (range.location == NSNotFound) {
        return filePath;
    }

    NSString *fileName = [filePath substringFromIndex:NSMaxRange(range)];
    
    return fileName;
}

- (void)stopLoading {
    
}

@end
