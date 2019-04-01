//
//  ManagementStoreAddCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagementStoreAddCell : BaseCell
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, copy) void (^addBlock)(void);

@end

NS_ASSUME_NONNULL_END
