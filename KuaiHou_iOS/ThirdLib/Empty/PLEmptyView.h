//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import <UIKit/UIKit.h>
#import "PLEmptyConfig.h"
enum PLEmptyViewType {
    PLEmptyViewTypeNoData = 1000, //没有数据
    PLEmptyViewTypeErrorData = 1001,     //接口异常
    PLEmptyViewTypeErrorNetWork = 1002  //网络异常
};
typedef void (^PLEmptyViewBlock)(void);
@interface PLEmptyView : UIView
@property (nonatomic, copy)     void(^emptyBtnActionBlock)(void);
@property(nonatomic,strong)PLEmptyConfig *emptyConfig;
@property (nonatomic, copy)     NSString *emptyBtnTitle;
@property (nonatomic,assign) NSInteger indexType;
+(PLEmptyView *)emptyWithConfig:(PLEmptyConfig *)config height:(CGFloat)height;

+(PLEmptyView *)emptyWithConfig:(PLEmptyConfig *)config height:(CGFloat)height emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock;

+(PLEmptyView *)emptyWithHeight:(CGFloat)height configBlock:(void (^)(PLEmptyConfig *config))configBlock;

+(PLEmptyView *)emptyWithHeight:(CGFloat)height configBlock:(void (^)(PLEmptyConfig *config))configBlock emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock;
-(void)destroy;
@end
