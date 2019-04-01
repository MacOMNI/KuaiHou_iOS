//
//  OpenStoreTipCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenStoreTipCell : BaseCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabW;

@end

NS_ASSUME_NONNULL_END
