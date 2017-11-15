//
//  WDHPageBaseViewController+Extension.m
//  WDHodoer
//
//  Created by acorld on 2017/7/18.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHBaseViewController+Extension.h"
#import "WDHPageModel.h"

@implementation WDHBaseViewController(Extension)

- (void) track_open_page{
    if (self.pageModel) {
		NSLog(@"open_page--->desc: %@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_open_page_success{
    if (self.pageModel) {
		NSLog(@"open_page_success--->desc: %@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_open_page_failure:(NSString *)error {
    if (self.pageModel) {
		NSLog(@"open_page_failure--->desc: %@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_close_page:(NSString *)pages {
	NSLog(@"close_page----> pgae: %@", pages);
}

- (void)track_page_ready{
    if (self.pageModel) {
		NSLog(@"page_ready----> :%@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_renderContainer{
    if (self.pageModel) {
		NSLog(@"renderContainer--->desc: %@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_renderContainer_success{
    if (self.pageModel) {
		NSLog(@"renderContainer_success--->desc: %@", @{@"page":self.pageModel.pagePath,@"openType":self.pageModel.openType});
    }
}

- (void)track_renderContainer_failure:(NSString *)error {
    if (self.pageModel) {
		NSLog(@"renderContainer_failure--->desc: %@", @{@"page":self.pageModel.pagePath,@"error":error});
    }
}

@end
