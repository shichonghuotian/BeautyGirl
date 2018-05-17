//
//  CardTableViewCell.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewCell : UITableViewCell
@property (strong,nonatomic) UIImageView *contentImageView;

+ (NSString*)TableViewCellIdentifier;

@end
