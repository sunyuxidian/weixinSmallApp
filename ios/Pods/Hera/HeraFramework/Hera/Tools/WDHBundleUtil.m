//
//  WDHBundleUti.m
//  WDSModule_Settings
//
//  Created by WangYiqiao on 2017/9/26.
//  Copyright © 2017年 wangcheng. All rights reserved.
//

#import "WDHBundleUtil.h"

static NSString *resouceBundleString_ = nil;

@implementation WDHBundleUtil

+ (void)initialize
{
	NSURL *resourceBundleURL = [[NSBundle mainBundle] URLForResource:@"HeraRes" withExtension:@"bundle"];
	if (resourceBundleURL) {
		resouceBundleString_ = [[NSBundle bundleWithURL:resourceBundleURL] resourcePath];
	}
}

+ (UIImage *)imageFromBundleWithName:(NSString *)imageName;
{
	if (![imageName isKindOfClass:[NSString class]] || !imageName.length) {
		return nil;
	}
	
	if (resouceBundleString_) {
		NSString *imagePath = [resouceBundleString_ stringByAppendingPathComponent:imageName];
		UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
		return image;
	}

	return nil;
}

@end
