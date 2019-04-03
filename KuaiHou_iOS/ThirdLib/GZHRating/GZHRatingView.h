//
//  GZHRatingView.h
//  ModernTimes
//
//  Created by 郭子豪 on 2017/12/6.
//  Copyright © 2017年 Stream. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GZHRatingView;


@protocol ratingViewDelegate <NSObject>

@optional
- (void)ratingView:(GZHRatingView *)view score:(CGFloat)score;

@end

typedef NS_ENUM(NSUInteger, RatingType) {
    INTEGER_TYPE, // 整颗心
    FLOAT_TYPE, // 任意心 保留的两位小数
    HALF_TYPE // 半颗心
};

@interface GZHRatingView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                  widDistance:(CGFloat)widDistance;

@property (nonatomic,assign)RatingType ratingType;//评分类型，整颗星或半颗星
@property (nonatomic,assign)CGFloat score;//当前分数
@property (nonatomic,assign)BOOL isCanTouch;

@property (nonatomic,assign)id<ratingViewDelegate> delegate;


@end
