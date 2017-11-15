//
//  WHE_request.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_request.h"

NSString *WHERequestMethodPOST = @"POST";
NSString *WHERequestMethodGET = @"GET";
NSString *WHERequestDataTypeJson = @"json";
NSString *WHERequestContentTypeJson = @"application/json";

@implementation WHE_request

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    
    NSString *urlString = self.url;
	if (!urlString) {
		failure(@{@"errMsg:": @"urlString为空"});
		return;
	}
	
    id data = self.data;
    NSDictionary *header = self.header;
    
    NSString *method = self.method;
    if (![method isEqualToString:WHERequestMethodPOST] && ![method isEqualToString:WHERequestMethodGET]) {
        method = WHERequestMethodGET;
    }
    
    NSString *dataType = self.dataType;
    if (!dataType) {
        dataType = WHERequestDataTypeJson;
    }
    
    //生成参数字符串
    NSString *paramString = nil;
    
    if ([data isKindOfClass:[NSString class]]) {
        paramString = data;
    }else {
        NSMutableString *tempParamString = [NSMutableString string];
        [data enumerateKeysAndObjectsUsingBlock:^(NSString*  _Nonnull key, NSString*  _Nonnull obj, BOOL * _Nonnull stop) {
            [tempParamString appendFormat:@"%@=%@&",key,obj];
        }];
        
        if ([tempParamString hasSuffix:@"&"]) {
            paramString = [tempParamString substringFromIndex:tempParamString.length-1];
        }else {
            
            paramString = tempParamString;
        }
    }
    
    NSMutableURLRequest *request = nil;
    //组装参数
    if ([method isEqualToString:WHERequestMethodPOST]) {
        NSURL *url = [NSURL URLWithString:urlString];
        request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    }else {
//        NSString *requestUrl = nil;
//        NSRange range = [urlString rangeOfString:@"?"];
//        if (range.location != NSNotFound) {
//            requestUrl = [urlString stringByAppendingFormat:@"&%@",requestUrl];
//        }else {
//            requestUrl = [urlString stringByAppendingFormat:@"?%@",requestUrl];
//        }
//        
//        urlString = requestUrl;
		//暂时不拼接param
        NSURL *url = [NSURL URLWithString:urlString];
        request = [NSMutableURLRequest requestWithURL:url];
    }
    
    request.HTTPMethod = method;
    
    //默认content-type为WHERequestContentTypeJson
    NSString *content_type = header[@"content-type"];
    if (!content_type) {
        content_type = WHERequestContentTypeJson;
        NSMutableDictionary *tempHeader = [NSMutableDictionary dictionaryWithDictionary:header];
        [tempHeader setObject:content_type forKey:@"content-type"];
        header = tempHeader;
    }
    
    //Set Header
    [header enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        [request setValue:obj forHTTPHeaderField:key];
    }];
    
    NSURLSession *session = [NSURLSession sharedSession];
    // 由于要先对request先行处理,我们通过request初始化task
    NSURLSessionTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            
                                            NSInteger statusCode = 200;
                                            NSHTTPURLResponse  *httpResponse = (NSHTTPURLResponse *)response;
                                            if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
                                                statusCode = httpResponse.statusCode;
                                            }
                                            
                                            if (data) {
                                                id result = nil;
                                                if ([dataType isEqualToString:WHERequestDataTypeJson]) {
                                                    result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                                }else {
                                                    result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                }
                                                
                                                NSLog(@"WHERequest response:%@", result);
                                                
                                                if (success) {
                                                    if (result) {
                                                        success(@{@"data":result,@"statusCode":@(statusCode)});
                                                    }else {
                                                        success(@{@"statusCode":@(statusCode)});
                                                    }
                                                }
                                            }else {
                                                
                                                if (error.code == NSURLErrorCancelled) {
                                                    if (cancel) {
                                                        cancel();
                                                    }
                                                }else {
                                                    if (failure) {
                                                        failure(@{@"statusCode":@(statusCode)});
                                                    }
                                                }
                                                
                                                
                                            }
                                        }];
    // 启动任务
    [task resume];
}

@end
