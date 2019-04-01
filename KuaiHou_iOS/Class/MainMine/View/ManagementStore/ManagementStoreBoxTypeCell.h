//
//  ManagementStoreBoxTypeCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagementStoreBoxTypeCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *boxMoneyLab;
@property (weak, nonatomic) IBOutlet UILabel *minMoneyLab;

@end

NS_ASSUME_NONNULL_END
