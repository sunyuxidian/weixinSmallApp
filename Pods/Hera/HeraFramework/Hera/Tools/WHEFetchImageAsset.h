//
//  WHEFetchImageAsset.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/PHAsset.h>
#import <AssetsLibrary/ALAsset.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    /// 选择
    WHEFetchImageAssetClickTypeSelect,
    /// 预览
    WHEFetchImageAssetClickTypePreview,
    
} WHEFetchImageAssetClickType;

@interface WHEFetchImageAsset : NSObject


/// store data PHAsset or ALAsset
@property (nonatomic, strong) id    data;
/// default NO
@property (nonatomic, assign) BOOL              isSelected;
/// store click type
@property (nonatomic, assign) WHEFetchImageAssetClickType  clickType;
/// PHAsset fullScreenImage 的下载进度
@property (nonatomic, assign) CGFloat           progress;
/// PHAsset fullScreenImage
@property (nonatomic, strong) UIImage           *fullScreenImage;

/**
 *  用PHAsset实例化一个WHEFetchImageAsset 对象
 *
 */
+ (WHEFetchImageAsset *)getFetchImageAsseWithPHAsset:(PHAsset *)phAsset;


/**
 *  用ALAsset实例化一个WHEFetchImageAsset 对象
 *
 */
+ (WHEFetchImageAsset *)getFetchImageAsseWithALAsset:(ALAsset *)alAsset;
@end
