//
//  LogginCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "LogginCell.h"

@implementation LogginCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)itemAction:(id)sender {
    UIButton *button = sender;
    if (self.itemBlock) {
        self.itemBlock(button.tag);
    }
}

@end
