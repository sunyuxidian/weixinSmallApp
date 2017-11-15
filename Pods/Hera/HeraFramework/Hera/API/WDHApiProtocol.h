//
//  WDHApiProtocol.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#ifndef WDHApiProtocol_h
#define WDHApiProtocol_h

@class WDHApiRequest;
@protocol WDHApiProtocol <NSObject>

/**
 收到内部API的请求
 */
- (void)didRecieveHybridApiWithApi:(WDHApiRequest *)request;

/**
 收到外部实现的API返回结果

 @param data 处理结果数据
 */
- (void)didRecieveApiResponseData:(NSDictionary *)data;

@end

#endif /* WDHApiProtocol_h */
