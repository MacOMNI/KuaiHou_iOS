//
//  WhereMaybeCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/16.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereMaybeCell.h"

@implementation WhereMaybeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.bgView.layer.shadowColor = [UIColor colorWithHexString:@"#000000" alpha:0.2].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,0);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 3;
    self.bgView.layer.cornerRadius = 5;
    
}

@end
