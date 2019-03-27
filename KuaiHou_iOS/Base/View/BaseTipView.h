//
//  BaseTipView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTipView : BaseView

@property (nonatomic, strong) UIView *maskView;

-(void)showView;

-(void)hiddenView;

@end

NS_ASSUME_NONNULL_END
