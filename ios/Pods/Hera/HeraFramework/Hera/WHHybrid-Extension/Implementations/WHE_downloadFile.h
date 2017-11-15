//
//  WHE_downloadFile.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/25.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_downloadFile : WHEBaseApi

/// 下载资源的 url
@property (nonatomic, copy) NSString *url;

/// HTTP 请求 Header
@property (nonatomic, strong) NSDictionary *header;

@end
