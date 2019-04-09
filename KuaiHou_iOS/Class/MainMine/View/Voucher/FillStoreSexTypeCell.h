//
//  FillStoreSexTypeCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FillStoreSexTypeCell : BaseCell
@property (weak, nonatomic) IBOutlet UIButton *manBtn;
@property (weak, nonatomic) IBOutlet UIButton *womanBtn;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) void (^itemBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
