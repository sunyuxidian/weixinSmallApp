//
//  WDHSystemConfig.m
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHSystemConfig.h"

@implementation WDHSystemConfig

+ (instancetype)sharedConfig {
	static WDHSystemConfig *shared = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if (!shared) {
			shared = [[WDHSystemConfig alloc] init];
		}
	});
	return shared;
}

@end
