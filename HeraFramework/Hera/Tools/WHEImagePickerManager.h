//
//  WHEImagePickerManager.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^imagePickerDidFinishPickBlock)(BOOL isCancel,NSArray *imageArray);

@interface WHEImagePickerManager : NSObject
+ (WHEImagePickerManager*)shareInstance;
/// defalut 15 张
@property (nonatomic, assign) NSInteger maxSelectedCount;

/**
 *  选多张图片
 *
 *  @param parentViewController present 父 controller
 *  @param pickBlock            回调block
 */
- (void)presentPickMultiPicturesWithController:(UIViewController *)parentViewController imagePickerDidFinishPickBlock:(imagePickerDidFinishPickBlock)pickBlock;
@end


@interface UIImage (imagePickerExt)


/********************************************
 *
 * @brief 图片顺时针旋转
 *
 * @param degrees 旋转角度
 *
 * @return 旋转后的图片
 *
 *******************************************/
- (UIImage *)rotateImgByDegrees:(CGFloat)degrees;

@end
