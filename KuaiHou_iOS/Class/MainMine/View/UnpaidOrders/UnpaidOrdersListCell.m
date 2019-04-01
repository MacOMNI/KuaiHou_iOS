//
//  UnpaidOrdersListCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "UnpaidOrdersListCell.h"

@implementation UnpaidOrdersListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setOrderMoney:(NSString *)orderMoney{
    NSString *str = [NSString stringWithFormat:@"总计：￥%@", orderMoney];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]      initWithString:str];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.0f] range:NSMakeRange(3,orderMoney.length +1)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:  kMainColor range:NSMakeRange(3,orderMoney.length +1)];
    self.orderNumLab.attributedText = attrStr;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
