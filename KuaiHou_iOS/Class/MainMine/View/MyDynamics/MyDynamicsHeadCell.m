//
//  MyDynamicsHeadCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyDynamicsHeadCell.h"

@implementation MyDynamicsHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [MyTool fixCornerradius:self.iconView cornerRadius:7.5 Color:kMainColor Width:2.5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)delAction:(id)sender {
    if (self.delBlock) {
        self.delBlock();
    }
}

@end
