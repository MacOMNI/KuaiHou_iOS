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
//        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.bgImgView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.ypLab];
        [self addSubview:self.sexImageView];
        [self addSubview:self.ageLab];
        [self addSubview:self.levelBgView];
        [self.levelBgView addSubview:self.levelLab];
        [self addSubview:self.titleLab];
        [self addSubview:self.lookNumLab];
        [self addSubview:self.collectionView];
        [self addSubview:self.lineView];
        
        [self.levelBgView bringSubviewToFront:self.levelLab];
        
        self.bgImgFrame = CGRectMake(0, 0, frame.size.width, frame.size.width);
        self.bgImgView.frame = self.bgImgFrame;
        
        UIImage *bgImg = self.bgImgView.image;
        self.bgImgH = kScreenSizeWidth * bgImg.size.height / bgImg.size.width;
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(15 + kScreenSizeWidth);
            make.left.equalTo(self.mas_left).offset(15);
            make.height.mas_equalTo(@23);
        }];
        
        [self.ypLab mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
           make.left.equalTo(self.mas_left).offset(15);
            make.height.mas_equalTo(@12);
        }];
        
        [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ypLab.mas_bottom).offset(15);
            make.left.equalTo(self.mas_left).offset(15);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        
        [self.ageLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sexImageView.mas_right).offset(10);
            make.centerY.equalTo(self.sexImageView.mas_centerY);

        }];

        [self.levelBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLab.mas_right).offset(10);
            make.centerY.equalTo(self.ageLab.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(35, 15));
        }];
        
        [self.levelLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            
        }];
        
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.sexImageView.mas_bottom).offset(15);
            make.left.equalTo(self.mas_left).offset(15);
            make.height.mas_equalTo(@15);
        }];
        
        [self.lookNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab.mas_right).offset(10);
            make.centerY.equalTo(self.titleLab.mas_centerY);
        }];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self.lookNumLab.mas_bottom).offset(15);
            make.height.mas_equalTo(@32);
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self.collectionView.mas_bottom).offset(15);
            make.height.mas_equalTo(@.5);
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
        frame.origin.y = -(self.bgImgH - kScreenSizeWidth);
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



- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:24.0f];
        _nameLabel.text = @"时光无声";
        _nameLabel.textColor = kMain_TextColor;
    }
    return _nameLabel;
}

-(UILabel *)ypLab{
    if (!_ypLab) {
        _ypLab = [UILabel new];
        _ypLab.font = [UIFont systemFontOfSize:15.0f];
        _ypLab.text = @"YP:20000249";
        _ypLab.textColor = kMain_TextColor;
    }
    return _ypLab;
}
-(UIImageView *)sexImageView{
    if (!_sexImageView) {
        _sexImageView = [UIImageView new];
        _sexImageView.image = [UIImage createImageWithColor:[UIColor yellowColor]];
    }
    return _sexImageView;
}

-(UILabel *)ageLab{
    if (!_ageLab) {
        _ageLab = [UILabel new];
        _ageLab.font = kFont(11);
        _ageLab.text = @"21";
        _ageLab.textColor = kMain_TextColor_9;
    }
    return _ageLab;
}

-(UIView *)levelBgView{
    if (!_levelBgView) {
        _levelBgView = [[UIView alloc] init];
        _levelBgView.backgroundColor = [UIColor blueColor];
        
        _levelBgView.layer.borderWidth = 0.5;
        _levelBgView.layer.borderColor = [UIColor colorWithRed:102/255.0 green:103/255.0 blue:102/255.0 alpha:1.0].CGColor;

        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,35,15);
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:254/255.0 green:221/255.0 blue:87/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:181/255.0 green:106/255.0 blue:36/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:181/255.0 green:106/255.0 blue:36/255.0 alpha:1.0].CGColor];
        gl.locations = @[@(0.0),@(0.5),@(1.0)];

        [_levelBgView.layer addSublayer:gl];
        _levelBgView.layer.cornerRadius = 2.5;
    }
    return _levelBgView;
}

-(UILabel *)levelLab{
    if (!_levelLab) {
        _levelLab = [[UILabel alloc] init];
        _levelLab.backgroundColor = [UIColor whiteColor];
        _levelLab.font = kFont(9);
        _levelLab.textAlignment = NSTextAlignmentCenter;
        _levelLab.text = @"LV18";
    }
    return _levelLab;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = kFont(15);
        _titleLab.textColor = kMain_TextColor;
        _titleLab.text = @"最近访问";
    }
    return _titleLab;
}

-(UILabel *)lookNumLab{
    if (!_lookNumLab) {
        _lookNumLab = [[UILabel alloc] init];
        _lookNumLab.font = kFont(15);
        _lookNumLab.textColor = kMain_TextColor_9;
        _lookNumLab.text = @"(56)";
    }
    return _lookNumLab;
}

-(UIView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UIView alloc] init];
        _collectionView.backgroundColor = [UIColor redColor];
    }
    return _collectionView;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kMain_lineColor;
    }
    return _lineView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
