//
//  WDHybridExtensionConverter.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WDHApiRequest;
@class WHEBaseApi;

@interface WDHybridExtensionConverter : NSObject

+ (WHEBaseApi *)apiWithRequest:(WDHApiRequest *)request;

@end
