//
//  InfoDetailIconCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "InfoDetailIconCell.h"

@implementation InfoDetailIconCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configImage:(NSString *)imageName title:(NSString *)title{
    UIImage *image = [UIImage loadImageWithName:imageName];
    CGSize imageSize = image.size;
    self.imageH.constant = imageSize.height;
    self.imageW.constant = imageSize.width;
    self.iconImageView.image = image;
    self.titleLab.text = title;
}

@end
