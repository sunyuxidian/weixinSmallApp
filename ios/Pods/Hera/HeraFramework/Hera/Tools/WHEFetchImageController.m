//
//  WHEFetchImageController.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEFetchImageController.h"
#import "WHEUIConstants.h"

@implementation WHEFetchImageController
- (id)initWithMaxSelectedCount:(NSInteger)maxCount finishBlock:(finishPickBlock)finishBlock cancelBlock:(cancelPickBlock)cancelBlock
{
    WHEAssetsGroupViewController *assetsGroupViewController = [[WHEAssetsGroupViewController alloc] init];
    assetsGroupViewController.maxSelectedCount = maxCount;
    assetsGroupViewController.finishBlock = finishBlock;
    assetsGroupViewController.cancelBlock = cancelBlock;
    self = [super initWithRootViewController:assetsGroupViewController];
    if (self) {
        self.navigationBar.translucent = NO;
        self.navigationBar.barTintColor = UIColorFromRGB(0xC60A1E);
        NSDictionary *attributesDic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
        self.navigationBar.titleTextAttributes = attributesDic;
    }
    
    return self;
}
@end
