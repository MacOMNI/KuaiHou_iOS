//
//  DIYWhereToPlayFilterView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"
#import "JLDoubleSlider.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYWhereToPlayFilterView : BaseTipView

@property (weak, nonatomic) IBOutlet UIButton *type_item0;
@property (weak, nonatomic) IBOutlet UIButton *type_item1;
@property (weak, nonatomic) IBOutlet UIButton *type_item2;
@property (weak, nonatomic) IBOutlet UIButton *type_item3;
@property (weak, nonatomic) IBOutlet UIButton *type_item4;

@property (weak, nonatomic) IBOutlet UIButton *ac_item0;
@property (weak, nonatomic) IBOutlet UIButton *ac_item1;
@property (weak, nonatomic) IBOutlet UIButton *ac_item2;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UILabel *currentLab;


@property (nonatomic, assign) NSInteger typeCurrentIndex;
@property (nonatomic, assign) NSInteger acCurrentIndex;
@property (nonatomic, strong)JLDoubleSlider *slider;

@property (nonatomic, assign) int maxValue;
@property (nonatomic, assign) int minValue;

@end

NS_ASSUME_NONNULL_END
