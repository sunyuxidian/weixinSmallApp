//
//  WHEFetchImageAsset.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEFetchImageAsset.h"

@implementation WHEFetchImageAsset


/**
 *  用PHAsset实例化一个WHEFetchImageAsset 对象
 *
 *  @param phAsset PHAsset
 *
 *  @return WHEFetchImageAsset
 */
+ (WHEFetchImageAsset *)getFetchImageAsseWithPHAsset:(PHAsset *)phAsset
{
    WHEFetchImageAsset *fetchImageAsset = [[WHEFetchImageAsset alloc] init];
    fetchImageAsset.isSelected = NO;
    fetchImageAsset.data = phAsset;
    return fetchImageAsset;
}


/**
 *  用ALAsset实例化一个WHEFetchImageAsset 对象
 *
 *  @param alAsset ALAsset
 *
 *  @return WHEFetchImageAsset
 */
+ (WHEFetchImageAsset *)getFetchImageAsseWithALAsset:(ALAsset *)alAsset
{
    WHEFetchImageAsset *fetchImageAsset = [[WHEFetchImageAsset alloc] init];
    fetchImageAsset.isSelected = NO;
    fetchImageAsset.data = alAsset;
    return fetchImageAsset;
}
@end
