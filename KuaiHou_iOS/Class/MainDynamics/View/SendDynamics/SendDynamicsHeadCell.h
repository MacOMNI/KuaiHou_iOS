//
//  SendDynamicsHeadCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SendDynamicsHeadCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
@property (nonatomic, copy) void (^delBlock)(void);

@end

NS_ASSUME_NONNULL_END
