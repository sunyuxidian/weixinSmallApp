//
//  WDHBaseViewController.m
//  WDHodoer
//
//  Created by WangYiqiao on 2017/10/27.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHBaseViewController.h"

@interface WDHBaseViewController ()

@end

@implementation WDHBaseViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

#pragma mark - Loading

/// 子类实现
- (void)showToast:(NSString *)text mask:(BOOL)mask duration:(int)duration {

}

/// 子类实现
- (void)startLoading:(NSString *)text mask:(BOOL)mask {
	
}

/// 子类实现
- (void)stopLoading {

}

#pragma mark - 下拉刷新

/// 子类实现
- (void)stopPullDownRefresh {

}

/// 子类实现
- (void)startPullDownRefresh {

}

#pragma mark - NavigationBar


- (void)startNaviLoading {
	[self.naviView startLoadingAnimation];
}


- (void)hideNaviLoading {
	[self.naviView hideLoadingAnimation];
}

/// 子类实现
- (void)setNaviFrontColor:(NSString *)frontColor andBgColor:(NSString *)bgColor withAnimationParam:(NSDictionary *)param {

}

#pragma mark - 内存清理

/// 子类实现
- (void)cleanMemory {
	
}

@end
