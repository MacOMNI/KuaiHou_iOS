//
//  DIYFilterView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYFilterView : BaseTipView
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *womanBtn;
@property (weak, nonatomic) IBOutlet UIButton *manBtn;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) void (^commitBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
