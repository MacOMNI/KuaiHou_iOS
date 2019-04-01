//
//  StoreSingleProductUnitCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoreSingleProductUnitCell : BaseCell
@property (weak, nonatomic) IBOutlet UITextField *unitTextField;
@property (weak, nonatomic) IBOutlet UIButton *item0;
@property (weak, nonatomic) IBOutlet UIButton *item1;
@property (weak, nonatomic) IBOutlet UIButton *item2;
@property (weak, nonatomic) IBOutlet UIButton *item3;
@property (weak, nonatomic) IBOutlet UIButton *item4;
@property (weak, nonatomic) IBOutlet UIButton *item5;
@property (weak, nonatomic) IBOutlet UIButton *item6;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) void (^valueChangeBlock)(UITextField *textField);

@end

NS_ASSUME_NONNULL_END
