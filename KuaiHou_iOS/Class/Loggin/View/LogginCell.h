//
//  LogginCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogginCell : BaseCell
@property (weak, nonatomic) IBOutlet UITextField *accTextField;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;

@property (nonatomic, copy) void (^itemBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
