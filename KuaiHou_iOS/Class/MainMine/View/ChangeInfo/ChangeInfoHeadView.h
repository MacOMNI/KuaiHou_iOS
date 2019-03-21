//
//  ChangeInfoHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
// kScreenSizeWidth * 385.0f / 704.0f

#define kWBHeaderHeight kScreenSizeWidth * 385.0f / 704.0f

@interface ChangeInfoHeadView : BaseView

@property (nonatomic, strong) UIImageView   *bgImgView;

@property (nonatomic, strong) UIView        *coverView;
@property (nonatomic, strong) UIImageView   *iconImgView;
@property (nonatomic, strong) UILabel       *nameLabel;

@property (nonatomic, assign) CGRect        bgImgFrame;
@property (nonatomic, assign) CGFloat       bgImgH;

- (void)scrollViewDidScroll:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
