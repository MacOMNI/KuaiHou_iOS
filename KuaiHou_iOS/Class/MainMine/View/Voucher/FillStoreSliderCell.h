//
//  FillStoreSliderCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"
#import "JLDoubleSlider.h"

NS_ASSUME_NONNULL_BEGIN

@interface FillStoreSliderCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *currentLab;
@property (nonatomic, strong)JLDoubleSlider *slider;

@property (nonatomic, assign) int maxValue;
@property (nonatomic, assign) int minValue;

@end

NS_ASSUME_NONNULL_END
