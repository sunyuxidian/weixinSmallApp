//
//  WHEAssetsGroupViewController.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHEFetchImageAsset.h"

/// 完成回调
typedef void(^finishPickBlock)(NSArray <WHEFetchImageAsset *>*);
/// 取消回调
typedef void(^cancelPickBlock)(void);

@interface WHEAssetsGroupViewController : UIViewController

/// 最大选择数
@property (nonatomic, assign) NSInteger     maxSelectedCount;
/// 完成回调
@property (nonatomic, copy) finishPickBlock finishBlock;
/// 取消回调
@property (nonatomic, copy) cancelPickBlock cancelBlock;
@end
