//
//  MyOrderDetailUserCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyOrderDetailUserCell.h"

@implementation MyOrderDetailUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)getHeightBycontent:(NSString *)content{
    CGFloat height = [MyTool getHeightByWidth:kScreenSizeWidth - 130 title:@"content" font:12] - 12;
    
    if (height < 0) {
        height = 0;
    }
    
    return height + 70;
}

@end
