//
//  MainHomeHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainHomeHeadView : BaseView

@property (nonatomic, strong) CustomTextField *textField;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *firstBgView;
@property (nonatomic, strong) UIView *nextBgView;

@property (nonatomic, assign) CGRect        bgImgFrame;
@property (nonatomic, assign) CGFloat       bgImgH;

- (void)scrollViewDidScroll:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
