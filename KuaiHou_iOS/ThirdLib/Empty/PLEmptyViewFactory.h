//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import <Foundation/Foundation.h>
#import "PLScrollViewEmptyView.h"
#import "PLEmptyView.h"
@interface PLEmptyViewFactory : NSObject
//网络异常带按钮
+(void)errorNetwork:(UIScrollView *)scrollView btnBlock:(void(^)(void))btnBlock;
+ (void)errorNetwork:(UIScrollView *)scrollView topMargin:(CGFloat)topMargin btnBlock:(void (^)(void))btnBlock;
//数据异常带按钮
+ (void)errorData:(UIScrollView *)scrollView btnBlock:(void (^)(void))btnBlock;
+ (void)errorData:(UIScrollView *)scrollView topMargin:(CGFloat)topMargin btnBlock:(void (^)(void))btnBlock;
// 暂无数据占位图
+ (void)emptyNoDataView:(UIScrollView *)scrollView
             btnBlock:(void(^)(void))btnBlock;
//  暂无数据占位图(无按钮)
+ (void)emptyNoDataView:(UIScrollView *)scrollView;
//  暂无数据占位图(自定义标题)
+ (void)emptyNoDataView:(UIScrollView *)scrollView title:(NSString *)title;
+ (void)emptyNoDataView:(UIScrollView *)scrollView title:(NSString *)title topMargin:(CGFloat)topMargin;
////  暂无数据占位图(深度自定义)
+ (void)emptyNoDataView:(UIScrollView *)scrollView config:(PLEmptyConfig *)config;

//网络异常
+(PLEmptyView *)errorNetworkWithView:(UIView *)view btnBlock:(void(^)(void))btnBlock;
+ (PLEmptyView *)errorNetworkWithView:(UIView *)view topOffset:(CGFloat)topOffset btnBlock:(void (^)(void))btnBlock;
//数据异常带按钮
+(PLEmptyView *)errorDataWithView:(UIView *)view btnBlock:(void (^)(void))btnBlock;
//  暂无数据占位图(自定义标题)
+ (PLEmptyView *)emptyNoDataViewWithView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName;
+ (PLEmptyView *)emptyNoDataViewWithView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName topOffset:(CGFloat)topOffset;
//加载中
+ (PLEmptyView *)emptyLodingDataViewWithView:(UIView *)view;
+ (PLEmptyView *)emptyLodingDataViewWithView:(UIView *)view topOffset:(CGFloat)topOffset;
@end
