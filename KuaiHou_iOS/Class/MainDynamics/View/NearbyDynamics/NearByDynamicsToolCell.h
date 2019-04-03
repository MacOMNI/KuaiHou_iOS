//
//  NearByDynamicsToolCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NearByDynamicsToolCell : BaseCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayout;
@property (weak, nonatomic) IBOutlet UIButton *contentNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@property (nonatomic, copy) void (^itmeBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
