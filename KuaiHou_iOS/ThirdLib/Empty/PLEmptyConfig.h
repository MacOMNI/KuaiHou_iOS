//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import <UIKit/UIKit.h>
//@property (nonatomic, assign) CGFloat imageTopMargin;
//@property (nonatomic, assign) CGFloat titleTopMargin;
//@property (nonatomic, assign) CGFloat detailTopMargin;
//@property (nonatomic, assign) CGFloat btnTopMargin;
//@property (nonatomic, assign) CGFloat btnWidth;
//@property (nonatomic, assign) CGFloat btnHeight;
@interface PLEmptyConfig : NSObject
//占位图
@property (nonatomic,strong) UIImage* emptyImage;
@property (nonatomic,assign) CGSize emptyImageSize;
//top
@property (nonatomic,assign) CGFloat emptyImageTopMargin;
//标题
@property (nonatomic,copy) NSString* emptyTitle;
@property (nonatomic,assign) CGFloat emptyTitleTopMargin;
//标题字体大小  默认 17.0f
@property (nonatomic,strong) UIFont* emptyTitleFont;
//标题字体默认颜色 默认为darkGrayColor
@property (nonatomic,strong) UIColor* emptyTitleColor;

//副标题
@property(nonatomic,copy) NSString* emptySubtitle;
//副标题字体大小
@property(nonatomic,strong) UIFont* emptySubTitleFont;
//副标题字体颜色 
@property(nonatomic,strong) UIColor* emptySubTitleColor;
@property (nonatomic,assign) CGFloat emptySubTitleTopMargin;

@property(nonatomic,strong) UIFont* emptyBtnTitleFont;
@property(nonatomic,strong) UIColor* emptyBtnTileColor;
@property(nonatomic,strong) UIImage* emptyBtnImage;
@property (nonatomic,assign) CGFloat emptyBtnTopMargin;
@property (nonatomic,strong) UIColor* emptyBtnBgColor;
@property (nonatomic,assign) CGFloat emptyBtnWidth;
@property (nonatomic,assign) CGFloat emptyBtnHeight;
// default CGPointZero
//空白页整体位置默认是在tableView居中显示
@property (nonatomic)   CGFloat emptyCenterOffset;

// default (x:0, y:-30)
//空白页的图片、按钮、文案之间的间距大小
@property (nonatomic)   CGFloat emptySpaceHeight;

// default YES
//添加空白页后ScrollView是否可以继续拖拽
@property (nonatomic)   BOOL allowScroll;
@end
