//
//  WHEScanViewController.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/8.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ScanCompletionBlock)(NSString *, NSString *);

@interface WHEScanViewController : UIViewController

/// 扫码后的回调
@property (nonatomic, copy) ScanCompletionBlock completionBlock;

/// 是否只能从相机扫码，不允许从相册选择图片 默认NO
@property (nonatomic, assign) BOOL isOnlyFromCamera;

@end
