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
        
        UILabel *label = [[UILabel alloc] init];
        
        label.numberOfLines = 0;
        [self.contentView addSubview:label];

        self.contentImageView = [[UIImageView alloc] init];
        self.contentImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.contentImageView];
        self.contentImageView.clipsToBounds = YES;
        
        [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(8);
            make.top.equalTo(self.contentView.mas_top).offset(8);
//            make.width.and.height.mas_equalTo(40);
//            make.height.equalTo(self.contentView.mas_height);
            make.height.mas_equalTo(130);;
//            make.right.equalTo(self.contentView.mas_right).offset(-8);
//uo
             make.width.mas_equalTo(self.contentView.mas_width).dividedBy(2);
            
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(8);
            make.top.equalTo(self.contentImageView.mas_bottom).offset(8);

              make.right.equalTo(self.contentView.mas_right).offset(-8);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);

        }];
        
        label.text = @"teset teset teset teset tesettesettesettesettesettesettesetteset";
        
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
