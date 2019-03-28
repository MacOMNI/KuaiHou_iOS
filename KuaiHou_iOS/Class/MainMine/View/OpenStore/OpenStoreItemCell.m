//
//  OpenStoreItemCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenStoreItemCell.h"

@implementation OpenStoreItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)itemAction:(UIButton *)sender {
    [self selTypeByTag:sender.tag];
    if (self.itemBlock) {
        self.itemBlock(sender.tag);
    }
}

-(void)selTypeByTag:(NSInteger)tag{
    self.swBtn.selected = tag == 0;
    self.lfBtn.selected = tag == 1;
    self.jbBtn.selected = tag == 2;
    self.qbBtn.selected = tag == 3;
}

@end
