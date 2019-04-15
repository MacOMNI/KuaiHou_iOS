//
//  WhereToPlayDetailHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailHeadView.h"

@implementation WhereToPlayDetailHeadView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.bannerView];
        [self addSubview:self.numberLab];
        
        kWEAKSELF;
        [self.bannerView setItemDidScrollOperationBlock:^(NSInteger currentIndex) {
            weakSelf.numberLab.hidden = NO;
            weakSelf.numberLab.text = [NSString stringWithFormat:@"%ld/%ld", currentIndex + 1, weakSelf.bannerView.imageURLStringsGroup.count];
        }];
        
        [self.bannerView setClickItemOperationBlock:^(NSInteger currentIndex) {
            
        }];
        
        self.bgImgFrame = CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeWidth);
        self.bgImgH = kScreenSizeWidth;
        
        [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.size.mas_equalTo(CGSizeMake(50, 22.5));
        }];

        [MyTool fixCornerradius:self.numberLab cornerRadius:11.25 Color:[UIColor clearColor] Width:0.5];
    }
    return self;
}

-(SDCycleScrollView *)bannerView{
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage loadImageWithName:@"base_imageload"]];
        _bannerView.showPageControl  = NO;
        _bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        
        NSArray *imagesURLStrings = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
        _bannerView.imageURLStringsGroup = imagesURLStrings;
    }
    return _bannerView;
}

-(UILabel *)numberLab{
    if (!_numberLab) {
        _numberLab = [UILabel new];
        _numberLab.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:.5];
        _numberLab.textColor = [UIColor whiteColor];
        _numberLab.font = kFont(14);
        _numberLab.hidden = YES;
        _numberLab.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLab;
}


- (void)scrollViewDidScroll:(CGFloat)offsetY {
    // headerView下拉放大
//    CGRect frame = self.bgImgFrame;
//    frame.size.height -= offsetY;
//
//    if (frame.size.height >= self.bgImgH) {
//        frame.size.height = self.bgImgH - offsetY;
//        //        frame.origin.y = -(self.bgImgH - kScreenSizeWidth);
//        frame.origin.y = offsetY;
//    }else {
//        frame.origin.y = offsetY;
//    }
//
//    self.bannerView.frame = frame;
}

@end
