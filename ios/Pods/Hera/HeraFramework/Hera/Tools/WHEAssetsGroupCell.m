//
//  WHEAssetsGroupCell.m
//  Hera
//
//  Created by SunYu on 2017/11/13.
//  Copyright © 2017年 weidian. All rights reserved.
//
#define kLeftMargin_ImageView       15

#import "WHEAssetsGroupCell.h"

#import "WHEFetchImageManager.h"



@interface WHEAssetsGroupCell ()

/// 标题
@property (nonatomic, strong) UILabel       *tileLabel;
/// 缩略图
@property (nonatomic, strong) UIImageView   *iconImageView;

@end

@implementation WHEAssetsGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self glSetup];
    }
    return self;
}
+ (CGFloat)viewHeight
{
    return 60;
}

- (CGSize)targetSize
{
    CGFloat border = [WHEAssetsGroupCell viewHeight] * ([UIScreen mainScreen].scale);
    return CGSizeMake(border, border);
}


- (void)glSetup
{
    if (!_tileLabel) {
        _tileLabel = [[UILabel alloc] init];
        _tileLabel.font = [UIFont systemFontOfSize:15];
        _tileLabel.textColor = [UIColor blackColor];
        [self addSubview:_tileLabel];
    }
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self addSubview:_iconImageView];
    }
}

- (void)fillData:(WHEFetchImageGroup *)group
{
    if (group) {
        // title
        _tileLabel.text = group.title;
        // image
        typeof(self) __weak weak_self  =self;
        [[WHEFetchImageManager sharedInstance] fetchPostImageWithGroup:group targetSize:[self targetSize] completion:^(UIImage *postImage) {
            if (postImage) {
                weak_self.iconImageView.image = postImage;
            }
        }];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _iconImageView.frame = CGRectMake(kLeftMargin_ImageView, 0, self.bounds.size.height, self.bounds.size.height);
//    self.leftMarginLine = _iconImageView.maxX;
    CGFloat x = CGRectGetMaxX(_iconImageView.frame) + kLeftMargin_ImageView;
    _tileLabel.frame = CGRectMake(x, 0, self.bounds.size.width - x - kLeftMargin_ImageView * 2, self.bounds.size.height);
}


@end
