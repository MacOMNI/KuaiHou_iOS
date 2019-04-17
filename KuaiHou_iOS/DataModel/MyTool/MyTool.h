//
//  MyTool.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/14.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTool : NSObject
    
+(instancetype )shareInstance;


@property (nonatomic, copy) void (^didFinishPickingPhotosHandle)(UIImage *photoImage, id asset);

typedef void(^ClickAlertBtnBlock)(UIAlertAction * action);
typedef void(^CancelAlertBtnBlock)(UIAlertAction * action);

#pragma mark- 判断是否是空字串
+ (BOOL)isBlankString:(NSString *)string;

#pragma mark 转化时间格式
+(NSString *)compareCurrentTime:(NSNumber *)timeSp isMicrosecond:(BOOL )isMicrosecond;
    
#pragma mark 指定宽度获取label的高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:( int)font;
    
#pragma mark 获取label的宽
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(int )font;
    
#pragma mark 获取当前页面显示视图
+ (UIViewController *)getCurrentVC;

#pragma mark 系统提示框
+(void)showAlertWithVc:(UIViewController *)vc title:(NSString *)title message:(NSString *)message btnName:(NSString *)btnName cancelName:(NSString *)cancelName clickAlertBtnBlock:(ClickAlertBtnBlock)clickAlertBtnBlock cancelBlock:(CancelAlertBtnBlock)cancelBlock;

#pragma mark 调用相机
-(void)takePhoto;

#pragma mark -md5
+(NSString *)md5:(NSString *)input;

#pragma mark -  判断字符串是否为空,为空的话返回 “” （一般用于保存字典时）
+(NSString *)isNotNull:(id)string;


+(BOOL)MatchLetter:(NSString *)str;

+(BOOL)isChineseFirst:(NSString *)firstStr;

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString;
    
/**
 加载网络图片
     
 @param imageView 目标视图
 @param urlStr 目标URL
 @param imageName 站位图名字
*/
+(void)sd_ImageView:(UIImageView *)imageView URLStr:(NSString *)urlStr placeholderImage:(NSString *)imageName;
    
/**
 view的圆角度跟边框颜色绘制
 @param view 目标view
 @param corner int类型的圆角度
 @param color 描边颜色
 @param width 描边宽度
*/
+(void)fixCornerradius:(UIView *)view cornerRadius:(CGFloat )corner Color:(UIColor *)color Width:(CGFloat )width;

/**
 空数据展示页面
 
 @param count <#count description#>
 @param viewController <#viewController description#>
 @param view <#view description#>
 @param title <#title description#>
 @param imageName <#imageName description#>
 */
+(void)fixNoDataCount:(NSInteger )count viewController:(UIViewController *)viewController targetView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName;


/**
 网络请求数据错误界面
 
 @param viewController <#viewController description#>
 @param view <#view description#>
 @param btnBlock <#btnBlock description#>
 */
+(void)fixNetErrByViewController:(UIViewController *)viewController targetView:(UIView *)view btnBlock:(void (^)(void))btnBlock;


// 实现图文混排的方法
+ (NSAttributedString *)creatAttrStringWithText:(NSString *) text image:(UIImage *) image font:(UIFont *)font;

//获取当前时间戳有两种方法(以秒为单位)
+ (NSString *)getNowTimeTimestamp;

/*
 周边加阴影，并且同时圆角
 */
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius;

/**
 *  根据文字内容动态计算UILabel宽高
 *  @param maxWidth label宽度
 *  @param font  字体
 *  @param lineSpacing  行间距
 *  @param text  内容
 */
+ (CGSize)boundingRectWithWidth:(CGFloat)maxWidth
                   withTextFont:(UIFont *)font
                withLineSpacing:(CGFloat)lineSpacing
                           text:(NSString *)text;

/**
 *  NSString转换成NSMutableAttributedString
 *  @param font  字体
 *  @param lineSpacing  行间距
 *  @param text  内容
 */
+ (NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                 withLineSpacing:(CGFloat)lineSpacing
                                                            text:(NSString *)text;

/**
 *  设置阴影
 */
+ (void)setShadowView:(UIView *)view shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;

/**
 * 创建特殊button
 */
+ (UIButton *)setupWithButton:(NSString *)title imgageStr:(NSString *)imageStr tag:(NSInteger)tag btnSize:(CGSize)btnSize fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor;

/**
 *  创建label
 */
+ (UILabel *)setupLabel:(NSString *)title textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor font:(UIFont *)font;

/*
 *  图文混排
 */
+ (NSMutableAttributedString *)stringWithImage:(NSString *)imageName textStr:(NSString *)textStr;


/**
 预览播放视频

 @param videPath videPath description
 */
+(void)playVideoByPath:(NSString *)videPath;



+(void)fixTopImageBtn:(UIButton *)btn Spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
