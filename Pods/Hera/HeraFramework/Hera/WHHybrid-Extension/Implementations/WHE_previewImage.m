//
//  WHE_previewImage.m
//  WHHybridDemo
//
//  Created by acorld on 2017/4/24.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHE_previewImage.h"
#import "WHECommonUtil.h"
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHFileManager.h"
#import "WDHAppInfo.h"

@implementation WHE_previewImage

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                    failure:(void(^_Null_unspecified)(id _Nullable))failure
                     cancel:(void(^_Null_unspecified)(void))cancel
{
    if (!self.urls || self.urls.count <= 0) {
        failure(@{@"errMsg": @"参数urls为空"});
        return;
    }
    
    NSArray *imageArray = [self parseUrls];
    
    NSUInteger selectIndex = 0;
    if (self.current) {
        NSUInteger index = [self.urls indexOfObject:self.current];
        if (index == NSNotFound) {
            index = 0;
        }
        
        selectIndex = index;
    }
    
//    [[GQImageViewer sharedInstance] setImageArray:imageArray textArray:nil];//这是数据源
//    [GQImageViewer sharedInstance].usePageControl = YES;//设置是否使用pageControl
//    [GQImageViewer sharedInstance].needLoopScroll = NO;//设置是否需要循环滚动
//    [GQImageViewer sharedInstance].needPanGesture = YES;//是否需要滑动消失手势
//    [GQImageViewer sharedInstance].selectIndex = selectIndex;//设置选中的索引
//    GQImageViewrConfigure *configure =
//    [GQImageViewrConfigure initWithImageViewBgColor:[UIColor blackColor]
//                                    textViewBgColor:nil
//                                          textColor:[UIColor whiteColor]
//                                           textFont:[UIFont systemFontOfSize:12]
//                                      maxTextHeight:100
//                                     textEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
//    [GQImageViewer sharedInstance].configure = configure;
//    [GQImageViewer sharedInstance].achieveSelectIndex = ^(NSInteger selectIndex){//获取当前选中的图片索引
//        NSLog(@"%ld",selectIndex);
//    };
//
//    BOOL statusBarEnable = [UIApplication sharedApplication].isStatusBarHidden;
//    [GQImageViewer sharedInstance].singleTap = ^(NSInteger selectIndex) {
//        NSLog(@"singleTap:%ld",selectIndex);
//        [[GQImageViewer sharedInstance] dissMissWithAnimation:YES];
//
//        [[UIApplication sharedApplication] setStatusBarHidden:statusBarEnable];
//    };
//    [GQImageViewer sharedInstance].laucnDirection = GQLaunchDirectionRight;//设置推出方向
//
//    //预览隐藏statusBar
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//
//    [[GQImageViewer sharedInstance] showInView:[WHECommonUtil appWindow] animation:YES];//显示GQImageViewer到指定view上

}

- (NSArray *)parseUrls {
    
    NSMutableArray *arr = [NSMutableArray array];
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    for(NSString *url in self.urls) {
        if ([url hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"tmp_"]]) {
            NSString *fileName = [self getFileName:url];
            NSString *filePath = [[WDHFileManager appTempDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
            NSString *fileUrl = [[NSURL fileURLWithPath:filePath] absoluteString];
            [arr addObject:fileUrl];
        } else if ([url hasPrefix:[WDH_FILE_SCHEMA stringByAppendingString:@"store_"]]) {
            NSString *fileName = [self getFileName:url];
            NSString *filePath = [[WDHFileManager appPersistentDirPath:app.appInfo.appId] stringByAppendingPathComponent:fileName];
            NSString *fileUrl = [[NSURL fileURLWithPath:filePath] absoluteString];
            [arr addObject:fileUrl];
        } else {
            [arr addObject:url];
        }
    }
    
    return arr;
}

- (NSString *)getFileName:(NSString *)filePath {
    
    NSRange range = [filePath rangeOfString: WDH_FILE_SCHEMA];
    NSString *fileName = [filePath substringFromIndex:NSMaxRange(range)];
    
    return fileName;
}

@end
