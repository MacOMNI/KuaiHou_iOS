//
//  ManagementStoreAddCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagementStoreAddCell.h"

@implementation ManagementStoreAddCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addAction:(id)sender {
    if (self.addBlock) {
        self.addBlock();
    }
}

@end
