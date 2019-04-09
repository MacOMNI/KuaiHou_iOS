//
//  DIYTelPhoneView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYTelPhoneView : BaseTipView
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@property (nonatomic, copy) void (^commitBlock)(void);
@property (nonatomic, copy) void (^cancleBlock)(void);
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancle_w;

@end

NS_ASSUME_NONNULL_END
