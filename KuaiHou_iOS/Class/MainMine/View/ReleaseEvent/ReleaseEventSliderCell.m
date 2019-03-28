//
//  ReleaseEventSliderCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ReleaseEventSliderCell.h"


@implementation ReleaseEventSliderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _slider = [[JLDoubleSlider alloc]initWithFrame:CGRectMake(15, 40, kScreenSizeWidth - 15 - 35, 40)];
    kWEAKSELF;
    [_slider setMaxValueBlock:^(CGFloat maxValue) {
        int maxV = maxValue;
        weakSelf.currLab.text = [NSString stringWithFormat:@"（%d）", maxV];
    }];
    _slider.minNum = 1;
    _slider.maxNum = 10;
//    _slider.unit = @"￥";
    _slider.minSlider.enabled = NO;
    _slider.minTintColor = kMain_TextColor_9;
    _slider.maxTintColor = kMain_TextColor_9;
    _slider.mainTintColor = kMainColor;
    
    
    [self.contentView addSubview:_slider];
    [self.contentView bringSubviewToFront:_slider];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
