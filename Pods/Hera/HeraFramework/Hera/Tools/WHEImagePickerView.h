//
//  WDImagePickerViewController.h
//  WDCommlib
//
//  Created by baoyuanyong on 15/5/12.
//  Copyright (c) 2015年 Koudai. All rights reserved.
//





#import <UIKit/UIKit.h>
//#import <GLImageProcessor/GLImageProcessor.h>

typedef NS_ENUM(NSUInteger, WHEImagePickerViewType) {
    WHEImagePickerViewTypeCamera,           // 相机
    WHEImagePickerViewTypePictureSingle,    // 单选
    WHEImagePickerViewTypePictureMulti      // 多选
};




@class GLViewController;


typedef void(^CompleteBlock)(BOOL isCancel,UIImage *image);
typedef void(^CompleteMultiSelectedBlock)(BOOL isCancel,NSArray *imageArray);

/**
 *  brief 选图控件
 *
 *  zhengxf add 2015-12-16
 */
@interface WHEImagePickerView : UIView

/**
 *  单选和拍照 回调 block
 */
@property (nonatomic, copy) CompleteBlock completeBlock;

/**
 *  多选 回调 block
 */
@property (nonatomic, copy) CompleteMultiSelectedBlock completeMultiSelectedBlock;

/**
 *   多选 最多选择照片书 must
 */
@property (nonatomic, assign) NSInteger maxSelectedCount;

/**
 *  brief 从相册里选图片
 *
 *  @param parentController 父 controller
 *  @param isSingle         单选 目前都是单选 多选未使用改组件
 *  @param allowEditing     是否允许编辑
 */
- (void)showWithParentController:(UIViewController *)parentController obtainSingleImage:(BOOL)isSingle allowEditing:(BOOL)allowEditing;

/**
 *  无选择视图出现
 *
 *  @param parentController
 *  @param type
 */
- (void)actionWithParentController:(UIViewController *)parentController pickerType:(WHEImagePickerViewType)type;

@end
