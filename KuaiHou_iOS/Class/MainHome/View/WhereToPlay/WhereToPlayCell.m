//
//  WhereToPlayCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayCell.h"

@implementation WhereToPlayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.bgView.layer.shadowColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.2].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,5);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 15;
    self.bgView.layer.cornerRadius = 7.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
