//
//  DIYPayView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYPayView : BaseTipView

@property (nonatomic, assign) NSInteger currentIndex;
@property (weak, nonatomic) IBOutlet UIButton *wechatIcon;
@property (weak, nonatomic) IBOutlet UIButton *alipayIcon;

@end

NS_ASSUME_NONNULL_END
