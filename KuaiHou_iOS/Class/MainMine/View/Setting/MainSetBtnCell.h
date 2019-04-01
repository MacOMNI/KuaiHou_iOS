//
//  MainSetBtnCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainSetBtnCell : BaseCell
@property (weak, nonatomic) IBOutlet UIButton *itemBtn;

@property (nonatomic, copy) void(^itemBlock)(void);

@end

NS_ASSUME_NONNULL_END
