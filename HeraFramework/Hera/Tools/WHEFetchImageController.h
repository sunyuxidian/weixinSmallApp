//
//  WHEFetchImageController.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHEAssetsGroupViewController.h"
#import "WHEFetchImageAsset.h"

/// 完成回调
typedef void(^finishPickBlock)(NSArray <WHEFetchImageAsset *>*);
/// 取消回调
typedef void(^cancelPickBlock)(void);

@interface WHEFetchImageController : UINavigationController
- (id)initWithMaxSelectedCount:(NSInteger)maxCount finishBlock:(finishPickBlock)finishBlock cancelBlock:(cancelPickBlock)cancelBlock;

@end
