//
//  WHEFetchImageGroup.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEFetchImageGroup.h"

@implementation WHEFetchImageGroup

+ (WHEFetchImageGroup *)getFetchImageGroupWithAssetsGroup:(ALAssetsGroup *)assetsGroup hasVideo:(BOOL)hasVideoFlag
{
    WHEFetchImageGroup *fetchImageGroup = [[WHEFetchImageGroup alloc] init];
    if (!hasVideoFlag) {
        [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
    }
    
    NSString *name = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    NSInteger count = [assetsGroup numberOfAssets];
    fetchImageGroup.title = [NSString stringWithFormat:@"%@ (%zd)",name,count];
    fetchImageGroup.data = assetsGroup;
    fetchImageGroup.name = name;
    return fetchImageGroup;
}


+ (WHEFetchImageGroup *)getFetchImageGroupWithAssetCollection:(PHAssetCollection *)assetCollection hasVideo:(BOOL)hasVideoFlag
{
    // 此处v7.1.0 热修复代码
    if (!assetCollection || ![assetCollection isKindOfClass:[PHAssetCollection class]]) {
        return nil;
    }
    
    WHEFetchImageGroup *fetchImageGroup = [[WHEFetchImageGroup alloc] init];
    
    PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
    // 默认排序 Passing "nil" for options gets the default
    //    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:YES]];
    if (!hasVideoFlag) {
        fetchOptions.predicate = [NSPredicate predicateWithFormat:@"mediaType = %d",PHAssetMediaTypeImage];
    }
    
    PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:fetchOptions];
    if (fetchResult.count > 0) {
        NSString *name = assetCollection.localizedTitle;
        NSInteger count = [fetchResult count];
        fetchImageGroup.title = [NSString stringWithFormat:@"%@ (%zd)",name,count];
        fetchImageGroup.data = fetchResult;
        fetchImageGroup.name = name;
        return fetchImageGroup;
    } else {
        return nil;
    }
}
@end
