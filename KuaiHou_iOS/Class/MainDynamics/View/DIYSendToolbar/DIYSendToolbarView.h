//
//  DIYSendToolbarView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"
#import "XXTextView.h"

typedef void(^inputTextBlock)(NSString *text);

NS_ASSUME_NONNULL_BEGIN

@interface DIYSendToolbarView : BaseView

/**文本输入框*/
@property (nonatomic, strong) XXTextView *textView;
/**发送按钮*/
@property (nonatomic, strong) UIButton *sendButton;
/**发送回调*/
@property (nonatomic, copy) inputTextBlock inputTextBlock;

/**设置输入框最大行数*/
@property (nonatomic, assign) NSInteger textViewMaxLine;
/**输入框文字大小*/
@property (nonatomic, assign) CGFloat fontSize;
/**占位文字*/
@property (nonatomic, copy) NSString *placeholder;
/**最大字数限制*/
@property (nonatomic, assign) NSInteger  maxNum;


/**收回键盘*/
-(void)bounceToolbar;
/**弹出键盘*/
- (void)popToolbar;
/**点击发送后的文字*/
- (void)inputToolbarSendText:(inputTextBlock)sendText;

@end

NS_ASSUME_NONNULL_END
