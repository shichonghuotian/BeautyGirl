//
//  CardTableViewCell.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "CardTableViewCell.h"

@implementation CardTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {

        self.contentImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.contentImageView];
        
        [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(8);
            make.top.equalTo(self.contentView.mas_top).offset(8);
//            make.width.and.height.mas_equalTo(40);
            make.height.mas_equalTo(100);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
//
            
            
        }];
        self.contentImageView.backgroundColor = [UIColor blueColor];
    
        
    }
 
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)TableViewCellIdentifier {
    
    return @"CardTableViewCell";
}

@end
