//
//  ReleaseEventSliderCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"
#import "JLDoubleSlider.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReleaseEventSliderCell : BaseCell

@property (nonatomic, strong)JLDoubleSlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *currLab;

@end

NS_ASSUME_NONNULL_END
