//
//  NearByDynamicsHeadCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NearByDynamicsHeadCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *distanceBtn;

@end

NS_ASSUME_NONNULL_END
