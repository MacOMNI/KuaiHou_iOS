//
//  AppCurrencyListCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCurrencyListCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@end

NS_ASSUME_NONNULL_END
