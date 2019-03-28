//
//  OpenStoreListCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenStoreListCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, copy) void (^valueChangeBlock)(UITextField *textField);

@end

NS_ASSUME_NONNULL_END
