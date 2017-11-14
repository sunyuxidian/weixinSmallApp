//
//  WHEAssetsListViewController.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WHEImagePickerBaseViewController.h"
#import "WHEFetchImageController.h"
@class WHEFetchImageGroup;

@interface WHEAssetsListViewController : WHEImagePickerBaseViewController <UITableViewDelegate, UITableViewDataSource>
/// 最大选择数
@property (nonatomic, assign) NSInteger             maxSelectedCount;
/// 当前的组
@property (nonatomic, strong) WHEFetchImageGroup     *currentGroup;
/// 完成回调
@property (nonatomic, copy) finishPickBlock     finishBlock;
/// 取消回调
@property (nonatomic, copy) cancelPickBlock     cancelBlock;


@end
