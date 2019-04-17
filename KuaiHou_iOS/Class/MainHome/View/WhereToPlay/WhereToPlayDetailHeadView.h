//
//  WhereToPlayDetailHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"
#import "SPCycleScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WhereToPlayDetailHeadView : BaseView <SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView* bannerView;

@property (nonatomic, assign) CGRect        bgImgFrame;
@property (nonatomic, assign) CGFloat       bgImgH;
@property (nonatomic, strong) UILabel *numberLab;
@property (nonatomic, strong) SPCycleScrollView *cycleScrollView;


- (void)scrollViewDidScroll:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
