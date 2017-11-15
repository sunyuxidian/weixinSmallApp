//
//  WHEAssetsGroupCell.h
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHEFetchImageGroup.h"

@interface WHEAssetsGroupCell : UITableViewCell
- (void)fillData:(WHEFetchImageGroup *)group;
+ (CGFloat)viewHeight;

@end
