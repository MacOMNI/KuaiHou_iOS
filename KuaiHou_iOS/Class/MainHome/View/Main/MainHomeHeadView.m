//
//  MainHomeHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainHomeHeadView.h"

@implementation MainHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self fixUI];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

-(void)fixUI{
    [self addSubview:self.bgImageView];
    [self addSubview:self.textField];
    [self addSubview:self.firstBgView];
    [self addSubview:self.nextBgView];
    
    self.bgImgFrame = CGRectMake(0, 0, self.frame.size.width, 150);
    self.bgImageView.frame = self.bgImgFrame;
//    UIImage *bgImg = self.bgImageView.image;
    self.bgImgH = 150;
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(22 + SafeAreaTopStatueMin);
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    [MyTool fixCornerradius:self.textField cornerRadius:15 Color:[UIColor whiteColor] Width:0.5];
    
    [self.firstBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(140);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(@100);
    }];
    self.firstBgView.layer.shadowColor = [UIColor colorWithHexString:@"#000000" alpha:0.2].CGColor;
    self.firstBgView.layer.shadowOffset = CGSizeMake(0,0);
    self.firstBgView.layer.shadowOpacity = 1;
    self.firstBgView.layer.shadowRadius = 3;
    self.firstBgView.layer.cornerRadius = 5;
    
//    [MyTool fixCornerradius:self.firstBgView cornerRadius:5 Color:[UIColor whiteColor] Width:0.5];
    
    [self.nextBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(250);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(@40);
    }];
    self.nextBgView.layer.shadowColor = [UIColor colorWithHexString:@"#000000" alpha:0.2].CGColor;
    self.nextBgView.layer.shadowOffset = CGSizeMake(0,0);
    self.nextBgView.layer.shadowOpacity = 1;
    self.nextBgView.layer.shadowRadius = 3;
    self.nextBgView.layer.cornerRadius = 5;
}

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.image = [UIImage loadImageWithName:@"home_headimage"];
    }
    return _bgImageView;
}

-(CustomTextField *)textField{
    if (!_textField) {
        _textField = [CustomTextField new];
        _textField.placeholder = @"搜索";
        _textField.placeholderDIYFont = kFont(12);
        _textField.placeholderDIYColor = kMain_TextColor;
        _textField.textColor = kMain_TextColor;
        _textField.font = kFont(12);
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView* leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,8, 14, 14)];
        leftImageView.image = [UIImage loadImageWithName:@"home_searchicon"];
        leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        _textField.leftView = leftImageView;
    }
    return _textField;
}

-(UIView *)firstBgView{
    if (!_firstBgView) {
        _firstBgView = [UIView new];
        _firstBgView.backgroundColor = [UIColor whiteColor];
    }
    return _firstBgView;
}

-(UIView *)nextBgView{
    if (!_nextBgView) {
        _nextBgView = [UIView new];
        _nextBgView.backgroundColor = [UIColor whiteColor];
    }
    return _nextBgView;
}

- (void)scrollViewDidScroll:(CGFloat)offsetY {
    // headerView下拉放大
    CGRect frame = self.bgImgFrame;
    frame.size.height -= offsetY;
    
    if (frame.size.height >= self.bgImgH) {
        frame.size.height = self.bgImgH - offsetY;
        //        frame.origin.y = -(self.bgImgH - kScreenSizeWidth);
        frame.origin.y = offsetY;
        self.bgImageView.frame = frame;
    }else {
        frame.origin.y = offsetY;
    }
    
    
}

@end
