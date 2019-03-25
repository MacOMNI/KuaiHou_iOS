//
//  DIYSendToolbarView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYSendToolbarView.h"


@interface DIYSendToolbarView ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *maskView; // 遮罩层

@property (nonatomic, strong) UIView *bgView;
/**键盘高度*/
@property (nonatomic, assign) CGFloat keyboardHeight;



@end

@implementation DIYSendToolbarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        [self fixUI];
    }
    return self;
}

-(void)fixUI{
    self.backgroundColor = [UIColor clearColor];
    self.maskView = [[UIView alloc] initWithFrame:self.bounds];
    self.maskView.backgroundColor = [UIColor blackColor];
    self.maskView.alpha = 0.0;
    self.maskView.userInteractionEnabled = YES;
    kWEAKSELF
    [self.maskView setTapActionWithBlock:^{
        weakSelf.hidden = YES;
        [weakSelf bounceToolbar];
    }];
    [self addSubview:self.maskView];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 50 -SafeAreaBottom, self.width, 50)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    
    self.sendButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.sendButton setTitle:@"确定" forState:(UIControlStateNormal)];
    [MyTool fixCornerradius:self.sendButton cornerRadius:15 Color:kMain_lineColor_C Width:0.5];
    [self.sendButton setBackgroundColor:kMain_lineColor];
    self.sendButton.titleLabel.font = kFont(15);
    [self.sendButton setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [self.sendButton addTarget:self action:@selector(sendAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bgView addSubview:self.sendButton];
    
    self.textView = [XXTextView new];
    self.textView.font = kFont(15);
    self.textView.xx_placeholder = @"发表评论";
    self.textView.xx_placeholderColor = kMain_TextColor_9;
    self.textView.textColor = kMain_TextColor;
    self.textView.delegate = self;
    self.textView.layoutManager.allowsNonContiguousLayout = NO;
    self.textView.scrollsToTop = NO;
    self.textView.textContainerInset = UIEdgeInsetsZero;
    self.textView.textContainer.lineFragmentPadding = 0;
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.enablesReturnKeyAutomatically = YES;
    [self.bgView addSubview:self.textView];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-15);
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(15);
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
        make.right.equalTo(self.sendButton.mas_left).offset(-15);
    }];
    
    self.fontSize = 15;
    self.textViewMaxLine = 3;
    
    [self addNotification];
}

// 添加通知
-(void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)setFontSize:(CGFloat)fontSize{
    _fontSize = fontSize;
    if (!fontSize || _fontSize < 15) {
        _fontSize = 15;
    }
    self.textView.font = [UIFont systemFontOfSize:_fontSize];
    self.textView.xx_placeholderFont = self.textView.font;
    CGFloat lineH = self.textView.font.lineHeight;
    _bgView.height = (ceil(lineH) + 10 + 10)<50?50: (ceil(lineH) + 10 + 10);
    self.textView.height = lineH;
}

- (void)setTextViewMaxLine:(NSInteger)textViewMaxLine {
    _textViewMaxLine = textViewMaxLine;
    if (!_textViewMaxLine || _textViewMaxLine <= 0) {
        _textViewMaxLine = 3;
    }
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.textView.xx_placeholder = placeholder;
}

#pragma mark keyboardnotification
- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _keyboardHeight = keyboardFrame.size.height;
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.bgView.y = keyboardFrame.origin.y - self.bgView.height;
    }];
}

- (void)keyboardWillHidden:(NSNotification *)notification {
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.bgView.y = self.height-50 - SafeAreaBottom;
        self.textView.text=nil;
        [self removeFromSuperview];
    }];
}

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGFloat contentSizeH = textView.contentSize.height;
    CGFloat lineH = textView.font.lineHeight;
    CGFloat maxTextViewHeight = ceil(lineH * self.textViewMaxLine + textView.textContainerInset.top + textView.textContainerInset.bottom);
    if (contentSizeH <= maxTextViewHeight) {
        textView.height = contentSizeH;
    }else{
        textView.height = maxTextViewHeight;
    }
    _bgView.height = (ceil(textView.height) + 10 + 10)<50?50: (ceil(textView.height) + 10 + 10);
    _bgView.bottom = kScreenSizeHeight - _keyboardHeight;
    [textView scrollRangeToVisible:NSMakeRange(textView.selectedRange.location, 1)];
}

-(void)sendAction{
    if (self.inputTextBlock) {
        self.inputTextBlock(self.textView.text);
    }
}
- (void)inputToolbarSendText:(inputTextBlock)sendText{
    self.inputTextBlock = sendText;
}

#pragma mark 弹出视图
-(void)popToolbar{
    self.fontSize = _fontSize;
    [self.textView becomeFirstResponder];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    @weakify(self);
    [UIView animateWithDuration:0.25 animations:^{
        @strongify(self);
        self.maskView.alpha = 0.5;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark 回收视图
-(void)bounceToolbar{
    
    self.textView.text = nil;
    [self.textView.delegate textViewDidChange:self.textView];
    [self endEditing:YES];
    self.maskView.alpha = 0.0;
//    [self removeFromSuperview];
//    @weakify(self);
//    [UIView animateWithDuration:0.25 animations:^{
//        @strongify(self);
//        self.maskView.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
//    }];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
