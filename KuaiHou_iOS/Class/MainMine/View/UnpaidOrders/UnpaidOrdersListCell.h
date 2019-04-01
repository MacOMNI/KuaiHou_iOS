//
//  UnpaidOrdersListCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UnpaidOrdersListCell : BaseCell

@property (weak, nonatomic) IBOutlet UIButton *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *orderNumLab;
@property (weak, nonatomic) IBOutlet UIView *lineView;

-(void)setOrderMoney:(NSString *)orderMoney;

@end

NS_ASSUME_NONNULL_END
