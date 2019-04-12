//
//  SettlementDetaildCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettlementDetaildCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyNumLab;
@property (weak, nonatomic) IBOutlet UILabel *currentMoneyLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *accLab;
@property (weak, nonatomic) IBOutlet UILabel *firstTime;
@property (weak, nonatomic) IBOutlet UILabel *nextTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;

@property (weak, nonatomic) IBOutlet UIView *typeLineView;
@property (weak, nonatomic) IBOutlet UIButton *endTypeBtn;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;


@end

NS_ASSUME_NONNULL_END
