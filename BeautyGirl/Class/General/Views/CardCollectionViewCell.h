//
//  CardCollectionViewCell.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) UIImageView *imageView;

+ (NSString*)CellIdentifier;

@end
