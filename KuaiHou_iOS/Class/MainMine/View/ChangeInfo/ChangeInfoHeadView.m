//
//  ChangeInfoHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ChangeInfoHeadView.h"

@interface ChangeInfoHeadView()



@end

@implementation ChangeInfoHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.bgImgView];
        [self.bgImgView addSubview:self.coverView];
        [self addSubview:self.iconImgView];
        [self addSubview:self.nameLabel];
        
        self.bgImgFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.bgImgView.frame = self.bgImgFrame;
        
        UIImage *bgImg = self.bgImgView.image;
        self.bgImgH = kScreenSizeWidth * bgImg.size.height / bgImg.size.width;
        
        //        [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.bgImgView);
        //        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-20.0f);
        }];
        
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.nameLabel.mas_top).offset(-10.0f);
            make.width.height.mas_equalTo(80.0f);
        }];
    }
    return self;
}



- (void)scrollViewDidScroll:(CGFloat)offsetY {
    // headerView下拉放大
    CGRect frame = self.bgImgFrame;
    frame.size.height -= offsetY;
    
    if (frame.size.height >= self.bgImgH) {
        frame.size.height = self.bgImgH;
        frame.origin.y = -(self.bgImgH - kWBHeaderHeight);
    }else {
        frame.origin.y = offsetY;
    }
    
    self.bgImgView.frame = frame;
}

#pragma mark - 懒加载
- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image = [UIImage imageNamed:@"wb_bg.jpg"];
        _bgImgView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImgView.clipsToBounds = YES;
    }
    return _bgImgView;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        _coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        _coverView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _coverView;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"wb_icon"];
        _iconImgView.layer.cornerRadius = 40.0f;
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:18.0f];
        _nameLabel.text = @"广文博见V";
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
