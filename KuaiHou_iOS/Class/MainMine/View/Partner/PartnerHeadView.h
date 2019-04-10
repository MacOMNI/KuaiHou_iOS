//
//  PartnerHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PartnerHeadView : BaseView

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UILabel *nickNameLab;

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *detailLab;


- (void)scrollViewDidScroll:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
