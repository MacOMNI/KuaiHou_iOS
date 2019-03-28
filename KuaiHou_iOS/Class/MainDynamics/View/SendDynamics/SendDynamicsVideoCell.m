//
//  SendDynamicsVideoCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SendDynamicsVideoCell.h"

@implementation SendDynamicsVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.delBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.delBtn setImage:[UIImage loadImageWithName:@"dynamics_delphoto"] forState:(UIControlStateNormal)];
    [self.delBtn addTarget:self action:@selector(delAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.contentView addSubview:self.delBtn];
    
    [self.delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoImageView.mas_top).offset(5);
        make.right.equalTo(self.videoImageView.mas_right).offset(-5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}

-(void)delAction{
    if (self.delBlock) {
        self.delBlock();
    }
}
- (IBAction)playAction:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
