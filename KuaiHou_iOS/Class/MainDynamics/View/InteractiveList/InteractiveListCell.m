//
//  InteractiveListCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "InteractiveListCell.h"

@implementation InteractiveListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)replyAction:(UIButton *)sender {
    if (self.replyBlock) {
        self.replyBlock();
    }
}

@end
