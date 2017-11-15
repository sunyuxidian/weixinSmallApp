//
//  WHEFetchImageManager.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHEFetchImageGroup.h"
#import "WHEFetchImageAsset.h"

/// 将要显示的时候 会发送此 通知 object 为 GLSelectView 实例
extern NSString *const KFetchPreviewImageSuccessNotification;

typedef NS_ENUM(NSInteger, WHEFetchImageAuthorizationStatus) {
    WHEFetchImageAuthorizationStatusNotDetermined = 0, // User has not yet made a choice with regards to this application
    WHEFetchImageAuthorizationStatusRestricted,        // This application is not authorized to access photo data.
    // The user cannot change this application’s status, possibly due to active restrictions
    //   such as parental controls being in place.
    WHEFetchImageAuthorizationStatusDenied,            // User has explicitly denied this application access to photos data.
    WHEFetchImageAuthorizationStatusAuthorized         // User has authorized this application to access photos data.
} ;


@interface WHEFetchImageManager : NSObject

/**
 *  选图 实例
 *
 *  @return 实例
 */
+ (WHEFetchImageManager *)sharedInstance;

/**
 *  获取照片的访问权限
 *
 *  @return GLFetchImageAuthorizationStatus
 */
+ (WHEFetchImageAuthorizationStatus)authorizationStatus;



+ (void)requestAuthorization:(void(^)(WHEFetchImageAuthorizationStatus status))handler;

/**
 *  获取照片的分组
 *
 *  @param hasVideoFlag 是否包含视频
 *  @param completion   完成block
 */
- (void)fetchImageGroupHasVideo:(BOOL)hasVideoFlag
                     completion:(void (^) (NSArray<WHEFetchImageGroup *> *groupArray))completion;

/**
 *  获取 分组下的照片
 *
 *  @param hasVideoFlag 是否包含视频 暂时无用
 *  @param group 分组
 *  @param completion 回调
 */
- (void)fetchImageAssetArrayHasVideo:(BOOL)hasVideoFlag
                               group:(WHEFetchImageGroup *)group
                          completion:(void (^) (NSArray <WHEFetchImageAsset *> *imageAssetArray))completion;

/**
 *  选出 分组 PostImage
 *
 *  @param group      分组
 *  @param completion 回到
 */
- (void)fetchPostImageWithGroup:(WHEFetchImageGroup *)group
                     targetSize:(CGSize)targetSize
                     completion:(void (^)(UIImage *postImage))completion;
/**
 *  选出 图片
 *
 */
- (void)fetchImageWithAsset:(WHEFetchImageAsset *)fetchImageAsset
                 targetSize:(CGSize)targetSize
                 completion:(void (^)(UIImage *image))completion progress:(void (^)(double progress))currentProgress;

/**
 *  选出 预览的图
 *
 */
- (void)fetchPreviewImageWithAsset:(WHEFetchImageAsset *)fetchImageAsset
                        completion:(void (^)(UIImage *previewImage))completion progress:(void (^)(double progress))currentProgress;



/**
 *  检查图片 是否在本地
 *
 */
- (BOOL)checkImageIsInLocalAblumWithAsset:(WHEFetchImageAsset *)fetchImageAsset;


@end
