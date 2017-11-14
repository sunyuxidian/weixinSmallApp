//
//  WHEAssetsPreviewViewController.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHEImagePickerBaseViewController.h"
@class WHEFetchImageAsset;

typedef void(^clickSelectBlock)(void);
typedef void(^clickFinishBlock)(void);
typedef BOOL(^clickCheckBlock)(WHEFetchImageAsset *);
@interface WHEAssetsPreviewViewController : WHEImagePickerBaseViewController
/// 最大选择数
@property (nonatomic, assign) NSInteger     maxSelectedCount;
/// 当前展示的
@property (nonatomic, retain) WHEFetchImageAsset *currentShowAsset;
/// data
@property (nonatomic, copy) NSArray *assetsDataArray;
/// 选择的Asset
@property (nonatomic, retain) NSMutableArray *selectAssetsArray;
/// 选择 block
@property (nonatomic, copy) clickSelectBlock clickSelectBlock;
/// 完成 block
@property (nonatomic, copy) clickFinishBlock clickFinishBlock;
/// check block
@property (nonatomic, copy) clickCheckBlock clickCheckBlock;


@end
