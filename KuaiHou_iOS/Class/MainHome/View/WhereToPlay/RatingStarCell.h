//
//  RatingStarCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface RatingStarCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (nonatomic, strong)GZHRatingView *startView;

@end

NS_ASSUME_NONNULL_END
