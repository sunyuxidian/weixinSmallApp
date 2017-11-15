//
//  WHE_uploadFile.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_uploadFile : WHEBaseApi

/// 开发者服务器 url
@property (nonatomic, copy) NSString *url;

/// 要上传文件资源的路径
@property (nonatomic, copy) NSString *filePath;

/// 文件对应的 key , 开发者在服务器端通过这个 key 可以获取到文件二进制内容
@property (nonatomic, copy) NSString *name;

/// HTTP 请求 Header , header 中不能设置 Referer
@property (nonatomic, strong) NSDictionary *header;

/// HTTP 请求中其他额外的 form data
@property (nonatomic, strong) NSDictionary *formData;

@end
