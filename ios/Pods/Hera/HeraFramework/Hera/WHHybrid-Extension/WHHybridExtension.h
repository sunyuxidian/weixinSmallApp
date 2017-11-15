//
//  WHHybridExtension.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHApiProtocol.h"
#import "WDHodoer.h"

typedef NS_ENUM(NSInteger,WDHExtensionCode) {
    WDHExtensionCodeCancel  = -1,  //取消
    WDHExtensionCodeSuccess = 0,   //成功
    WDHExtensionCodeFailure = 1,   //失败
};

extern NSString *const WDHExtensionKeyCode;
extern NSString *const WDHExtensionKeyData;

@interface WHHybridExtension : NSObject <WDHApiProtocol>

/*注册扩展的api，对业务宿主有用*/
+ (void)registerExtensionApi:(NSString *)api handler:(id(^)(id param))handler;

/**
 给小程序发送消息

 @param message 消息内容
 */
+ (void)sendMessage:(NSDictionary *)message;

@end
