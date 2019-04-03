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

typedef NS_ENUM(NSUInteger, AnimateType) {
    ZOOM_ANIMATE = 0, // 放大缩小动画
    BOTTOM_ANIMATE, // 从下往上出现的动画
};

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, assign) AnimateType animateType;

-(void)showView;

-(void)hiddenView;

@end

NS_ASSUME_NONNULL_END
