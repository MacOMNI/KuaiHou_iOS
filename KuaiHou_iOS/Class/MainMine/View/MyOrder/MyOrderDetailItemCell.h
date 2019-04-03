//
//  MyOrderDetailItemCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/2.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyOrderDetailItemCell : BaseCell

@property (nonatomic, copy)void (^itemBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
