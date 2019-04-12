//
//  DIYSelectTimeView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYSelectTimeView : BaseTipView

@property (nonatomic, strong)void (^selectAction) (NSString * selectmonth, NSString *detailStr);

@end

NS_ASSUME_NONNULL_END
