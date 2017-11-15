//
//  WDHApi.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHApiProtocol.h"
#import "WDHApiRequest.h"

@interface WDHApi : NSObject

/// api代理
@property (nonatomic, weak) id <WDHApiProtocol> delegate;

/**
 调用API
 */
- (void)callAPIWithCommand:(NSString *)command param:(NSString *)param callback:(WDHApiRequestCallback)callback;

@end
