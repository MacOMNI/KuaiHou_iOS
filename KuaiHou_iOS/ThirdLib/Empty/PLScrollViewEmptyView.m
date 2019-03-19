//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import "PLScrollViewEmptyView.h"
#import "UIScrollView+EmptyDataSet.h"
#import <objc/runtime.h>
static char const * const kEmptyView = "kEmptyView";
@interface UIScrollView (PLEmptyView)
@property (nonatomic, strong) PLScrollViewEmptyView *emptyView;
@end
@implementation UIScrollView (PLEmptyView)
-(PLScrollViewEmptyView *)emptyView
{
    return objc_getAssociatedObject(self, kEmptyView);
}
- (void)setEmptyView:(PLScrollViewEmptyView *)emptyView
{
     objc_setAssociatedObject(self, kEmptyView, emptyView, OBJC_ASSOCIATION_RETAIN);
}
@end

@interface PLScrollViewEmptyView ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end
@implementation PLScrollViewEmptyView
{
    __weak UIScrollView *_emptyContentView;
}

- (id)initWithContentView:(UIScrollView *)contentView config:(PLEmptyConfig *)config
{
    self = [super init];
    if (self) {
        _emptyContentView = contentView;
       self.emptyConfig = config;
        
        _emptyContentView.emptyDataSetSource = self;
        _emptyContentView.emptyDataSetDelegate = self;
        
        // check the scrollView's category   查看上面类目方法
        // catch the assistant in this way   持有对象，防止crash
        _emptyContentView.emptyView = self;
    }
    return self;
}
+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView emptyConfig:(PLEmptyConfig *)config
{
   PLScrollViewEmptyView *emptyView = [[PLScrollViewEmptyView alloc] initWithContentView:contentView config:config];
  return emptyView;
}

+(PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView emptyConfig:(PLEmptyConfig *)config emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock
{
    PLScrollViewEmptyView *emptyView = [[PLScrollViewEmptyView alloc] initWithContentView:contentView config:config];
    emptyView.emptyBtnTitle = btnTitle;
    emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;
}

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView configBlock:(void (^)(PLEmptyConfig *))configBlock
{
   PLEmptyConfig *config = [PLEmptyConfig new];
    !configBlock ?: configBlock(config);
    PLScrollViewEmptyView *emptyView = [[PLScrollViewEmptyView alloc] initWithContentView:contentView
                                                                                             config:config];
    return emptyView;

}

+ (PLScrollViewEmptyView *)emptyWithContentView:(UIScrollView *)contentView configBlock:(void (^)(PLEmptyConfig *))configBlock emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock
{
     PLEmptyConfig *config = [PLEmptyConfig new];
      !configBlock ?: configBlock(config);
    PLScrollViewEmptyView *emptyView = [[PLScrollViewEmptyView alloc] initWithContentView:contentView
                                                                                   config:config];
    emptyView.emptyBtnTitle = btnTitle;
    emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;
}

#pragma mark-判断是否有自定义配置
- (PLEmptyConfig *)emptyConfig
{
    return _emptyConfig?:[PLEmptyConfig new];
}

- (NSString *)emptyBtnTitle
{
    return _emptyBtnTitle ?: @"";
}

#pragma mark - DZNEmptyDataSetSource
#pragma mark-标题样式及文案
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfig.emptyTitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfig.emptyTitleColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyConfig.emptyTitle
                                           attributes:attributes];
}

#pragma mark-副标题样式及文案
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfig.emptySubTitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfig.emptySubTitleColor,
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:self.emptyConfig.emptySubtitle attributes:attributes];
}

#pragma mark-显示图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyImage;
}

#pragma mark-底部按钮样式
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfig.emptyBtnTitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfig.emptyBtnTileColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyBtnTitle attributes:attributes];
}

#pragma mark-底部按钮图片
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.emptyConfig.emptyBtnImage;
}

#pragma mark-整体背景色
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}

#pragma mark-占位页可否滚动
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return self.emptyConfig.allowScroll;
}

#pragma mark -垂直方向的Offset
-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyCenterOffset;
}

#pragma mark -间距
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptySpaceHeight;
}

- (CGFloat)imageTopMarginForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyImageTopMargin;
}
- (CGFloat)titleTopMarginForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyTitleTopMargin;
}
-(CGFloat)detailTopMarginForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptySubTitleTopMargin;
}
- (CGFloat)btnTopMarginForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyBtnTopMargin;
}

- (CGFloat)btnHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyBtnHeight;
}

-(CGFloat)btnWidthForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyBtnWidth;
}
- (UIColor *)btnBackgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfig.emptyBtnBgColor;
}
#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    !self.emptyBtnActionBlock ?: self.emptyBtnActionBlock();
}

@end
