//
//  PartnerHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "PartnerHeadView.h"

@implementation PartnerHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self fixUI];
    }
    
    return self;
}

-(void)fixUI{
    [self addSubview:self.headImageView];
    [self addSubview:self.nickNameLab];
    [self addSubview:self.typeLab];
    [self addSubview:self.detailLab];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.headImageView.mas_top);
    }];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLab.mas_right);
        make.centerY.equalTo(self.nickNameLab.mas_centerY);
    }];
    
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.bottom.equalTo(self.headImageView.mas_bottom);
    }];
}

-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [UIImageView new];
        _headImageView.backgroundColor = kMainColor;
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        [MyTool fixCornerradius:_headImageView cornerRadius:20 Color:[UIColor clearColor] Width:0.5];
        
    }
    return _headImageView;
}

-(UILabel *)nickNameLab{
    if (!_nickNameLab) {
        _nickNameLab = [MyTool setupLabel:@"郭子豪" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
    }
    return _nickNameLab;
}
-(UILabel *)typeLab{
    if (!_typeLab) {
        _typeLab = [MyTool setupLabel:@"（合伙人）" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor_9 font:kFont(12)];
    }
    return _typeLab;
}
-(UILabel *)detailLab{
    if (!_detailLab) {
        _detailLab = [MyTool setupLabel:@"下一级：直推（10/15），直属团队（合伙人1/5）" textAlignment:NSTextAlignmentLeft textColor:kMain_TextColor font:kFont(12)];
    }
    return _detailLab;
}


- (void)scrollViewDidScroll:(CGFloat)offsetY {
    // headerView下拉放大
}

@end
