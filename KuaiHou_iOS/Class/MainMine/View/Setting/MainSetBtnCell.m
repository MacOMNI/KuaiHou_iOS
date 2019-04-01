//
//  MainSetBtnCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainSetBtnCell.h"

@implementation MainSetBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [MyTool fixCornerradius:self.itemBtn cornerRadius:20 Color:kMain_lineColor_C Width:0.5];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)itemAction:(UIButton *)sender {
    if (self.itemBlock) {
        self.itemBlock();
    }
}

@end
