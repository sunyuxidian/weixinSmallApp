//
//  WHEImagePickerBaseViewController.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEImagePickerBaseViewController.h"

@interface WHEImagePickerBaseViewController ()

@end

@implementation WHEImagePickerBaseViewController

- (UIBarButtonItem *)glLeftItem
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 50, 30);
    [leftButton addTarget:self action:@selector(glGoBack) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[WDHBundleUtil imageFromBundleWithName:@"WDIPh_btn_navi_back"] forState:UIControlStateNormal];
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 15);
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    return leftButtonItem;
}

- (void)glGoBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
