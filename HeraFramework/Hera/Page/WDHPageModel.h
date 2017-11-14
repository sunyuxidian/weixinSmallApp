//
//  WDHPageModel.h
//  WDHodoer
//
//  Created by acorld on 2017/7/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDHPageStyle : NSObject
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *navigationBarBackgroundColor;
@property (nonatomic, copy) NSString *backgroundTextStyle;
@property (nonatomic, copy) NSString * navigationBarTextStyle;
@property (nonatomic, copy) NSString * navigationBarTitleText;
@property (nonatomic, assign) BOOL enablePullDownRefresh;
@end

@interface WDHTabbarItemStyle : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pagePath;
@property (nonatomic, copy) NSString *iconPath;
@property (nonatomic, copy) NSString *selectedIconPath;
@property (nonatomic, assign) BOOL isDefaultPath;


@end


@interface WDHTabbarStyle : NSObject
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *selectedColor;
@property (nonatomic, copy) NSString *backgroundColor;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *borderStyle;
@property (nonatomic, copy) NSArray <WDHTabbarItemStyle *> *list;

/// 返回方式
@property (nonatomic, copy) NSString *backType;
@end



/// 页面数据模型
@interface WDHPageModel : NSObject

@property (nonatomic, assign) unsigned long long  pageId;
@property (nonatomic, copy) NSString *pageRootDir;
@property (nonatomic, strong) WDHPageStyle * pageStyle;
@property (nonatomic, strong) WDHPageStyle *windowStyle;
@property (nonatomic, strong) WDHTabbarStyle *tabbarStyle;
@property (nonatomic, copy) NSString *openType;
@property (nonatomic, copy) NSString * query;
@property (nonatomic, copy) NSString * pagePath;

/// 返回方式
@property (nonatomic, copy) NSString *backType;

- (NSString *) pathKey;
- (NSString *)wholePageUrl;
- (NSString *) pagePathUrl;
- (void)updateTitle:(NSString *)title;
+ (WDHPageStyle *) parseWindowStyleData:(NSDictionary *)window;
+ (WDHPageStyle *)parsePageStyleData:(NSDictionary *)pages path:(NSString *)path;

@end


