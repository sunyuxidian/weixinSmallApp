//
//  WDHScriptMessageHandlerDelegate.h
//  WDHodoer
//
//  Created by acorld on 2017/7/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

//这个类的功能是封装WKScriptMessageHandler协议，目的是避免WKUserContentController.add的强引用而不释放，产生循环引用
@interface WDHWeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id <WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)delegate;

@end

