//
//  FillStoreSliderCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FillStoreSliderCell.h"

@implementation FillStoreSliderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.maxValue = 20;
    self.minValue = 1;
    _slider = [[JLDoubleSlider alloc]initWithFrame:CGRectMake(15, 40, kScreenSizeWidth - 15 - 35, 40)];
    kWEAKSELF;
    
    [_slider setMaxValueBlock:^(CGFloat maxValue) {
        int maxV = maxValue;
        weakSelf.maxValue = maxV;
//
    }];
    [_slider setMinValueBlock:^(CGFloat minValue) {
        weakSelf.minValue = minValue;
    }];
    _slider.minNum = self.minValue;
    _slider.maxNum = self.maxValue;
    //    _slider.unit = @"￥";
//    _slider.minSlider.enabled = NO;
    _slider.minTintColor = kMain_TextColor_9;
    _slider.maxTintColor = kMain_TextColor_9;
    _slider.mainTintColor = kMainColor;
    
    
    [self.contentView addSubview:_slider];
}

-(void)setMaxValue:(int)maxValue{
    _maxValue = maxValue;
    self.currentLab.text = [NSString stringWithFormat:@"（%d~%d）", self.minValue, maxValue];
}

-(void)setMinValue:(int)minValue{
    _minValue = minValue;
    self.currentLab.text = [NSString stringWithFormat:@"（%d~%d）", minValue, self.maxValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
