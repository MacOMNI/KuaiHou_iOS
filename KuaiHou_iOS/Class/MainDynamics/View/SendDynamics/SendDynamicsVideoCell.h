//
//  SendDynamicsVideoCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SendDynamicsVideoCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;

@property (nonatomic, strong) UIButton *delBtn;

@property (nonatomic, copy) void (^delBlock)(void);

@property (nonatomic, copy) void (^playBlock)(void);

@end

NS_ASSUME_NONNULL_END
