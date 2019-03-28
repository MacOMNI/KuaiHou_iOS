//
//  OpenStoreItemCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenStoreItemCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *swBtn;
@property (weak, nonatomic) IBOutlet UIButton *lfBtn;
@property (weak, nonatomic) IBOutlet UIButton *jbBtn;
@property (weak, nonatomic) IBOutlet UIButton *qbBtn;

@property (nonatomic, copy) void (^itemBlock)(NSInteger tag);

-(void)selTypeByTag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
