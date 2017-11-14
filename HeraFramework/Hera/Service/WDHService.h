//
//  WDHService.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * kWDHServiceOpenTypeAppLaunch ;
extern NSString * kWDHServiceOpenTypeNavigateBack ;
extern NSString * kWDHServiceOpenTypeRedirectTo ;

@class WDHManager;
@interface WDHService : NSObject

@property (nonatomic, strong) NSDictionary *appConfig;

- (instancetype)initWithAppConfiguration:(NSDictionary *)appConfiguration manager:(WDHManager *)manager;

- (void)loadConfigFileWithCompletion:(void(^)(NSDictionary *dic))completion;
- (void)publishCallbackHandler:(NSString *)callbackId;
- (void)onAppRoute:(NSString *)routeType htmlPath:(NSString *)htmlPath queryString:(NSString *)queryString webId:(unsigned long long)webId;
- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam webId:(unsigned long long)webId;
- (void)callSubscribeHandlerWithEvent:(NSString *)eventName jsonParam:(NSString *)jsonParam;
- (void)invokeCallbackHandler:(int)callbackId param:(NSString *)param;

@end
