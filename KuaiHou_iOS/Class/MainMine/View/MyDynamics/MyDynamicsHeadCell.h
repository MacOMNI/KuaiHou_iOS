//
//  MyDynamicsHeadCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyDynamicsHeadCell : BaseCell
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@property (nonatomic, copy) void (^delBlock)(void);

@end

NS_ASSUME_NONNULL_END
