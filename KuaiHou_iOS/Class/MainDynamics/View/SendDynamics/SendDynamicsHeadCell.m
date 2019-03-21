//
//  SendDynamicsHeadCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SendDynamicsHeadCell.h"

@implementation SendDynamicsHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)delAction:(UIButton *)sender {
    if (self.delBlock) {
        self.delBlock();
    }
}

@end
