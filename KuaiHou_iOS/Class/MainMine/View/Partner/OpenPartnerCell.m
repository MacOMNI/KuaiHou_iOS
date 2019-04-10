//
//  OpenPartnerCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenPartnerCell.h"
#import "DIYPayView.h"

@implementation OpenPartnerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)open:(id)sender {
    DIYPayView *pay = [[DIYPayView alloc] init];
    [pay showView];
}

@end
