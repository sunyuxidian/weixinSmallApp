//
//  WDHManagerProtocol.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WDHPageModel;

@protocol WDHManagerProtocol <NSObject>

/**
 处理Service层的publish消息

 @param eventName 事件名
 @param param 参数JSON对象
 @param webIds 页面Id
 @param callbackId 回调ID
 */
- (void)service_publishHandler:(NSString *)eventName param:(NSString *)param webIds:(NSArray *)webIds callbackId:(NSString *)callbackId;

/**
 处理Service层的API调用事件

 @param command 事件名
 @param param 参数
 @param callbackId 回调ID
 */
- (void)service_apiRequest:(NSString *)command param:(NSString *)param callbackId:(int)callbackId;

/**
 处理Service层的调用内部API事件

 @param command 事件
 @param param 参数
 @param callbackId 回调ID
 */
- (void)service_innerApiRequest:(NSString *)command param:(NSString *)param callbackId:(int)callbackId;

/**
 处理Page层的Publish事件

 @param eventName 事件名
 @param param 参数
 @param pageModel 页面数据
 @param callbackId 回调参数
 */
- (void)page_publishHandler:(NSString *)eventName param:(NSString *)param pageModel:(WDHPageModel *)pageModel callbackId:(NSString *)callbackId;

/**
 开启服务
 */
- (void)startService;

/**
 停止服务
 */
- (void)stopService;


@end
