//
//  CardCollectionViewCell.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "CardCollectionViewCell.h"

@implementation CardCollectionViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
//        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);

        }];
    }
    return self;
}
+ (NSString*)CellIdentifier {
    
    return @"CardCollectionViewCell";
}

@end
