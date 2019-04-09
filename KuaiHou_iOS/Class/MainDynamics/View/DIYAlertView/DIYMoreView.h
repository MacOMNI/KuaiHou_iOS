//
//  DIYMoreView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYMoreView : BaseTipView

@property (nonatomic, copy) void (^itmeBlock)(NSInteger tag);
@property (weak, nonatomic) IBOutlet UIButton *itme_1;
@property (weak, nonatomic) IBOutlet UIButton *item_2;

@end

NS_ASSUME_NONNULL_END
