//
//  MyDynamicsPhotosView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickTagBlock)(NSInteger tag);

@interface MyDynamicsPhotosView : BaseView

@property (nonatomic, strong) NSArray *photosArray;
@property (nonatomic, copy) ClickTagBlock clickTagBlock;

/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
