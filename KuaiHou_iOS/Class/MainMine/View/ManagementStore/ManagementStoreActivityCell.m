//
//  ManagementStoreActivityCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagementStoreActivityCell.h"

@implementation ManagementStoreActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

+(CGFloat)getHeightByContent:(NSString *)content{
    
    
    return [MyTool getHeightByWidth:kScreenSizeWidth - 30 title:content font:15] + 10 + 12 + 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
