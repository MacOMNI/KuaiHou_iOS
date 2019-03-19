//
//  CirclePhotosView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickTagBlock)(NSInteger tag);

@interface CirclePhotosView : UIView

@property (nonatomic, strong) NSArray *photosArray;
@property (nonatomic, copy) ClickTagBlock clickTagBlock;


/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
