//
//  WDHApiRequest.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WDHApiRequestCallback)(NSDictionary<NSString *, NSObject *> *result);

@interface WDHApiRequest : NSObject

/// api方法
@property (nonatomic, copy) NSString *command;

/// 请求参数
@property (nonatomic, strong) NSDictionary *param;

/// 请求回执
@property (nonatomic, copy) WDHApiRequestCallback callback;

@end
