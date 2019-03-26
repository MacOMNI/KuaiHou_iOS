//
//  MyDynamicsImageCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^PictureTagBlock)(NSInteger tag);

@interface MyDynamicsImageCell : BaseCell

@property (nonatomic, copy) PictureTagBlock pictureTagBlock;

+(CGFloat)cellHeightWithImageCount:( int )count ;

#pragma mark 只是测试这样写而已
- (void)setCircleModelImageCount:( int )count ;

- (void)setCircleModelImageArray:( NSArray * )dataArray;

@end

NS_ASSUME_NONNULL_END
