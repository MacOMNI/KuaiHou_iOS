//
//  MyProcessingOrderCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyProcessingOrderCell.h"

@implementation MyProcessingOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)itemAction:(UIButton *)sender {
    if (self.itemBlock) {
        self.itemBlock(sender.tag);
    }
}


@end
