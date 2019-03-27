//
//  ManagerUserCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagerUserCell.h"

@implementation ManagerUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [MyTool fixCornerradius:self.unBindBtn cornerRadius:15 Color:kMain_lineColor_C Width:0.5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
