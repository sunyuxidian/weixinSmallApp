//
//  WDHPageModel.m
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDHPageModel.h"
#import "WDHUtils.h"


@implementation WDHTabbarItemStyle



@end

@implementation WDHTabbarStyle


@end

@implementation WDHPageStyle



@end

@implementation WDHPageModel

- (instancetype)init
{
    if (self = [super init]) {
        self.pageId = [self hash];
    }
    
    return self;
}

- (NSString *) pathKey {
    NSArray *pathArray = [_pagePath componentsSeparatedByString:@"."];
    NSString *pathKey = pathArray.firstObject;
    return pathKey;
}

- (NSString *)wholePageUrl{
    
    return [NSString stringWithFormat:@"%@/%@",self.pageRootDir,[self pagePathUrl]];
}

- (NSString *) pagePathUrl {
    NSArray *pathArray = [_pagePath componentsSeparatedByString:@"."];
    if(pathArray.count > 1) {
        return self.pagePath;
    }
    return [self.pagePath stringByAppendingString:@".html"];
}

- (void)updateTitle:(NSString *)title {
    if (self.pageStyle) {
        self.pageStyle.navigationBarTitleText = title;
    }
}

//解析Style
+ (WDHPageStyle *) parseWindowStyleData:(NSDictionary *)window {
    WDHPageStyle *model = [WDHPageStyle new];
    model.navigationBarBackgroundColor = [WDHUtils WH_Color_Conversion:window[@"navigationBarBackgroundColor"]];
    model.backgroundColor = [WDHUtils WH_Color_Conversion:window[@"backgroundColor"]];
    model.backgroundTextStyle = window[@"backgroundTextStyle"];
    model.navigationBarTextStyle = window[@"navigationBarTextStyle"];
    model.navigationBarTitleText = window[@"navigationBarTitleText"];
	model.enablePullDownRefresh =  [window[@"enablePullDownRefresh"] boolValue];
    
    return model;
}

+ (WDHPageStyle *)parsePageStyleData:(NSDictionary *)pages path:(NSString *)path {
    
    return [WDHPageModel parseWindowStyleData:pages[path]];
}

@end
