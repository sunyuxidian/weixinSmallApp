
// UINavigationController+MemoryClean.m
// WDHodoer

//Created by WangYiqiao on 2017/9/18.
//Copyright © 2017年 weidian. All rights reserved.


#import "UINavigationController+WDHodoerLifeCycle.h"
#import <objc/runtime.h>
#import "WDHBaseViewController.h"
#import "WDHAppManager.h"
#import "WDHApp.h"

@implementation UINavigationController (WDHodoerLifeCycle)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		swizzleMethod([self class], @selector(popViewControllerAnimated:), @selector(wh_popViewControllerAnimated:));
		swizzleMethod([self class], @selector(popToViewController:animated:), @selector(wh_popToViewController:animated:));
		swizzleMethod([self class], @selector(popToRootViewControllerAnimated:), @selector(wh_popToRootViewControllerAnimated:));
		swizzleMethod([self class], @selector(pushViewController:animated:), @selector(wh_pushViewController:animated:));
	});
}

#pragma mark - Handler

/*监控被推出的页面*/
- (void)wdh_handlePopPages:(NSArray *)popedControllers
{
	// 被推出的页面是否全部为非小程序页面
	BOOL isAllNormalPage = YES;
	
	// 是否包含小程序根页面
	BOOL isContainAppRootPage = NO;
	
	//如果小程序根页面被推出了 则说明小程序退出了
	for (UIViewController *vc in popedControllers) {
		if ([vc isKindOfClass:[WDHBaseViewController class]]) {
			isAllNormalPage = NO;
			WDHApp *app = [[WDHAppManager sharedManager] currentApp];
			if ([app isAppRootPage:(WDHBaseViewController *)vc]) {
				[app stopApp];
				isContainAppRootPage = YES;
			}
		}
	}
	
	//如果返回到小程序 则小程序进入前台
	UIViewController *topVC = self.topViewController;
	if ([topVC isKindOfClass:WDHBaseViewController.class] && (isAllNormalPage || isContainAppRootPage)){
		WDHApp *app = [[WDHAppManager sharedManager] currentApp];
		[app onAppEnterForeground];
	}
}

/**
 监控被push的页面
 */
- (void)wdh_handlePushPage:(UIViewController *)viewController {
	
	UIViewController *topVC = [self topViewController];
	//判断当前是否在小程序页面
	if ([topVC isKindOfClass:[WDHBaseViewController class]]) {
		//如果将要展示的页面不是小程序页面 则认为小程序进入后台
		if (viewController && ![viewController isKindOfClass:WDHBaseViewController.class]){
			WDHApp *app = [[WDHAppManager sharedManager] currentApp];
			[app onAppEnterBackground];
		}
	}
}

#pragma mark - Pop

- (NSArray *)wh_popToRootViewControllerAnimated:(BOOL)animated
{
	NSArray *array = [self wh_popToRootViewControllerAnimated:animated];
	[self wdh_handlePopPages:array];
	return array;
}

- (UIViewController *)wh_popViewControllerAnimated:(BOOL)animated {
	
	UIViewController *vc = [self wh_popViewControllerAnimated: animated];
	
	if(vc) {
		[self wdh_handlePopPages:@[vc]];
	}
	
	return vc;
}

- (NSArray *)wh_popToViewController:(UIViewController *)controller animated:(BOOL)animated
{
	NSArray *array = [self wh_popToViewController:controller animated:animated];
	
	[self wdh_handlePopPages:array];
	
	return array;
}

#pragma mark - Push

- (void)wh_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
	
	[self wdh_handlePushPage:viewController];
	
	[self wh_pushViewController:viewController animated:animated];
}

#pragma mark - Helper

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
	
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
	
	BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
	
	if (didAddMethod) {
		class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
	} else {
		method_exchangeImplementations(originalMethod, swizzledMethod);
	}
}

@end
