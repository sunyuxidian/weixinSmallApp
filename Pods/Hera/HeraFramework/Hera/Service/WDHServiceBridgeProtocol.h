//
//  WDHServiceBridgeProtocol.h
//  WDHodoer
//
//  Created by acorld on 2017/7/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef WDHServiceBridgeProtocol_h
#define WDHServiceBridgeProtocol_h

@protocol WDHServiceBridgeProtocol <NSObject>

- (void)serviceBridgeDidNeedInjectScript:(NSString *)script completionHandler:(void(^)(id result,NSError *error))completionHandler;

@end

#endif /* WDHServiceBridgeProtocol_h */
