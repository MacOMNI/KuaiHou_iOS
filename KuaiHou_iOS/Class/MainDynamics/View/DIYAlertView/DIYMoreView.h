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

@end

NS_ASSUME_NONNULL_END
