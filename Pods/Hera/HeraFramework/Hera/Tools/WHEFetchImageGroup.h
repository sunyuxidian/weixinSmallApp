//
//  WHEFetchImageGroup.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface WHEFetchImageGroup : NSObject
/// 组名称
@property (nonatomic, copy) NSString *name;
/// 分组列表 展示title（组名+count）
@property (nonatomic, copy) NSString *title;
/// 组数据 ALAssetsGroup/PHFetchResult
@property (nonatomic, strong) id data;



/**
 *  用ALAssetsGroup实例一个对象
 *
 *  @param assetsGroup 数据单元
 *  @param hasVideoFlag     是否包含视频
 *
 *  @return 对象
 */
+ (WHEFetchImageGroup *)getFetchImageGroupWithAssetsGroup:(ALAssetsGroup *)assetsGroup hasVideo:(BOOL)hasVideoFlag;



/**
 *  用PHAssetCollection实例一个对象
 *
 *  @param assetCollection 数据单元
 *  @param hasVideoFlag    是否包含视频
 *
 *  @return can be nil
 */
+ (WHEFetchImageGroup *)getFetchImageGroupWithAssetCollection:(PHAssetCollection *)assetCollection hasVideo:(BOOL)hasVideoFlag;

@end
