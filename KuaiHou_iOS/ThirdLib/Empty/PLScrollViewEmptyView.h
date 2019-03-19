//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import <Foundation/Foundation.h>
#import "PLEmptyConfig.h"
@interface PLScrollViewEmptyView : NSObject
@property(nonatomic,strong)PLEmptyConfig *emptyConfig;
@property (nonatomic, copy)     NSString *emptyBtnTitle;
@property (nonatomic, copy)     void(^emptyBtnActionBlock)(void);

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView
                                        emptyConfig:(PLEmptyConfig *)config;

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView
                                        emptyConfig:(PLEmptyConfig *)config
                                        emptyBtnTitle:(NSString *)btnTitle
                            emptyBtnActionBlock:(void(^)(void))btnActionBlock;

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView
                                        configBlock:(void (^)(PLEmptyConfig *config))configBlock;

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView
                                        configBlock:(void (^)(PLEmptyConfig *config))configBlock
                                        emptyBtnTitle:(NSString *)btnTitle
                            emptyBtnActionBlock:(void(^)(void))btnActionBlock;
@end
