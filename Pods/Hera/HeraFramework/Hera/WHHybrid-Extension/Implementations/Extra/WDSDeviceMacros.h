//
//  WDSDeviceMacros.h
//  WDSCommonLib
//
//  Created by zephyrhan on 16/1/20.
//  Copyright © 2016年 Weidian. All rights reserved.
//

#ifndef WDSDeviceMacros_h
#define WDSDeviceMacros_h

#define WEAK(_instance_)            __weak typeof(_instance_) weak_##_instance_ = _instance_;

/**
 *
 *  ******************************************* 硬件设备iPhone4...、iPad *******************************************
 *
 */
#pragma mark - 硬件设备iPhone4...、iPad

#define IS_DEVICE_IPHONE                        ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) ? YES : NO)
#define IS_DEVICE_IPAD                          ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)   ? YES : NO)

/// iPhone6Plus 标准模式
#define IS_DEVICE_IPHONE_6_Plus                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/// iPhone6Plus 放大模式
#define IS_DEVICE_IPHONE_6_Plus_Scale           ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

/// 包含（iPhone6Plus和 放大模式）
#define IS_DEVICE_IPHONE_6_Plus_Or_Scale        (IS_DEVICE_IPHONE_6_Plus_Scale || IS_DEVICE_IPHONE_6_Plus)

/// iPhone6 的手机
#define IS_DEVICE_IPHONE_6                      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/// iPhone5 的手机
#define IS_DEVICE_IPHONE_5                      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/// iPhone4 的手机
#define IS_DEVICE_IPHONE_4                      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)




/**
 *
 *  ******************************************* 系统版本 *******************************************
 *
 */
#pragma mark - 系统版本

#define IS_SYSTEM_IOS10                             ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
#define IS_SYSTEM_IOS9                              ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)
#define IS_SYSTEM_IOS8                              ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
#define IS_SYSTEM_IOS7                              ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
#define IS_SYSTEM_IOS6                              ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)



/**
 *
 *  ******************************************* 屏幕情况 *******************************************
 *
 */
#pragma mark - 屏幕情况

#define SCREEN_WIDTH                            [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT                           [[UIScreen mainScreen] bounds].size.height

/// 5.5寸屏幕
#define SCREEN_IS_INCHES_55                     (SCREEN_HEIGHT == 736)
/// 5.5寸以下屏幕
#define SCREEN_LESSTHAN_INCHES_55               (SCREEN_HEIGHT  < 736)
/// 5.5寸以上屏幕
#define SCREEN_LARGERTHAN_INCHES_55             (SCREEN_HEIGHT  > 736)

/// 4.7寸屏幕
#define SCREEN_EQUAL_INCHES_47                  (SCREEN_HEIGHT == 667)
/// 4.7寸以下屏幕
#define SCREEN_LESSTHAN_INCHES_47               (SCREEN_HEIGHT  < 667)
/// 4.7寸以上屏幕
#define SCREEN_LARGERTHAN_INCHES_47             (SCREEN_HEIGHT  > 667)

/// 4.0寸屏幕
#define SCREEN_EQUAL_INCHES_40                  (SCREEN_HEIGHT == 568)
/// 4.0寸以下屏幕
#define SCREEN_LESSTHAN_INCHES_40               (SCREEN_HEIGHT  < 568)
/// 4.0寸以上屏幕
#define SCREEN_LARGERTHAN_INCHES_40             (SCREEN_HEIGHT  > 568)

/// 3.5寸屏幕
#define SCREEN_EQUAL_INCHES_35                  (SCREEN_HEIGHT == 480)


/// 1px线的大小
#define DEFAULT_BORDER_WIDTH                    (([UIScreen mainScreen].scale == 1.0) ? 1.0f : ([UIScreen mainScreen].scale == 3.0)? 0.35f: 0.5f)


#endif /* WDSDeviceMacros_h */
