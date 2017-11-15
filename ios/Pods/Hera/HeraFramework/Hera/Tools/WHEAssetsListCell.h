//
//  WHEAssetsListCell.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WHEFetchImageAsset;
#import "WHEAssetsPreviewViewController.h"

extern CGFloat kELCAssetCellHeight;
extern CGFloat kELCAssertOffset;
extern NSInteger kELCAssetCellColoumns;

typedef void(^clickAssetBlock)(WHEFetchImageAsset *asset);

@interface WHEAssetsListCell : UITableViewCell

- (id)initWithAssets:(NSArray *)assets reuseIdentifier:(NSString *)identifier;

- (void)setAssets:(NSArray *)assets;

/// 点击回调
@property (nonatomic, copy) clickAssetBlock clickAssetBlock;
/// 校验回到 before clickAssetBlock
@property (nonatomic, copy) clickCheckBlock clickCheckBlock;

@end
