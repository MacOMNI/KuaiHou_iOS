//
//  RatingStarCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "RatingStarCell.h"
#import "GZHRatingView.h"

@implementation RatingStarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _startView = [[GZHRatingView alloc] initWithFrame:CGRectMake(80, self.titleLab.y, 150, 15) widDistance:5];
    
    _startView.ratingType = FLOAT_TYPE;
    _startView.score = 3.25;
    _startView.isCanTouch = NO;
    
    [self.contentView addSubview:_startView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _startView.centerY = self.contentView.centerY;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
