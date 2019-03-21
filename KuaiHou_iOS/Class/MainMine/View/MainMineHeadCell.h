//
//  MainMineHeadCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/19.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainMineHeadCell : BaseCell
@property (weak, nonatomic) IBOutlet UIView *infoBgView;
@property (weak, nonatomic) IBOutlet UIView *levelBgView;
@property (weak, nonatomic) IBOutlet UILabel *levelLab;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *ypLab;

@property (nonatomic, copy) void (^itemBlock) (int tag);

@end

NS_ASSUME_NONNULL_END
