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

#define kWBHeaderHeight (kScreenSizeWidth + 200)

@interface ChangeInfoHeadView : BaseView

@property (nonatomic, strong) UIImageView   *bgImgView;
@property (nonatomic, strong) UILabel       *nameLabel;
@property (nonatomic, assign) CGRect        bgImgFrame;
@property (nonatomic, assign) CGFloat       bgImgH;
@property (nonatomic, strong) UILabel       *ypLab;

@property (nonatomic, strong) UIImageView *sexImageView;

@property (nonatomic, strong) UILabel *ageLab;

@property (nonatomic, strong) UIView *levelBgView;

@property (nonatomic, strong) UILabel *levelLab;

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *lookNumLab;

@property (nonatomic, strong) UIView *collectionView;

@property (nonatomic, strong) UIView    *lineView;

- (void)scrollViewDidScroll:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
