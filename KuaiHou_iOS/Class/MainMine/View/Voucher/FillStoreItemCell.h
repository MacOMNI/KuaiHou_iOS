//
//  FillStoreItemCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FillStoreItemCell : BaseCell


@property (nonatomic, assign) NSInteger currentIndex;
@property (weak, nonatomic) IBOutlet UIButton *itme0;
@property (weak, nonatomic) IBOutlet UIButton *itme1;
@property (weak, nonatomic) IBOutlet UIButton *itme2;
@property (weak, nonatomic) IBOutlet UIButton *itme3;

@property (nonatomic, copy) void (^selItemBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
