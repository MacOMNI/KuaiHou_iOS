//
//  OpenStoreListCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenStoreListCell.h"

@implementation OpenStoreListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_textField addTarget:self action:@selector(actionToValueChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)actionToValueChange:(UITextField *)textField
{
    if (self.valueChangeBlock) {
        self.valueChangeBlock(textField);
    }
}


@end
