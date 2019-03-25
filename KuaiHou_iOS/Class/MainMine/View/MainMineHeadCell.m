//
//  MainMineHeadCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/19.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainMineHeadCell.h"

@implementation MainMineHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.infoBgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.13].CGColor;
    self.infoBgView.layer.shadowOffset = CGSizeMake(0,1);
    self.infoBgView.layer.shadowOpacity = 1;
    self.infoBgView.layer.shadowRadius = 12;
    self.infoBgView.layer.cornerRadius = 5;
    
    self.levelBgView.layer.borderWidth = 0.5;
    self.levelBgView.layer.borderColor = [UIColor colorWithRed:102/255.0 green:103/255.0 blue:102/255.0 alpha:1.0].CGColor;
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,35,15);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:254/255.0 green:221/255.0 blue:87/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:181/255.0 green:106/255.0 blue:36/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:181/255.0 green:106/255.0 blue:36/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0.0),@(0.5),@(1.0)];
    [self.levelBgView.layer addSublayer:gl];
    self.levelBgView.layer.cornerRadius = 2.5;
    [self.levelBgView bringSubviewToFront:self.levelLab];
    
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"LV13" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:174/255.0 green:109/255.0 blue:48/255.0 alpha:1.0]}];
    
    self.levelLab.attributedText = string;
    
    CGFloat distance = (kScreenSizeWidth - 30 - 50 * 4) / 3.0;
    NSArray *imageArray = @[@{@"image":@"mine_headitem1", @"title":@"钱包"},@{@"image":@"mine_headitem2", @"title":@"订单"},@{@"image":@"mine_headitem3", @"title":@"推广"},@{@"image":@"mine_headitem4", @"title":@"代金券"}];
    
    for (int i = 0 ; i < 4; i ++) {
        NSDictionary *dict = imageArray[i];
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15 + (50 + distance) * i, 213, 50, 70)];
        bgView.tag = i + 100;
        bgView.userInteractionEnabled = YES;
        [self.contentView addSubview:bgView];
        
        __weak UIView *weakView = bgView;
        [bgView setTapActionWithBlock:^{
//            NSLog(@"%ld", bgView.tag);
            
            if (self.itemBlock) {
                self.itemBlock((int)weakView.tag);
            }
        }];
        
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.image = [UIImage loadImageWithName:dict[@"image"]];
        [bgView addSubview: imageview];
        
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bgView.mas_top);
            make.centerX.mas_equalTo(bgView.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        
        UILabel *lab = [MyTool setupLabel:dict[@"title"] textAlignment:NSTextAlignmentCenter textColor:kMain_TextColor font:kFont(15)];
        [bgView addSubview: lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(bgView.mas_bottom);
            make.centerX.mas_equalTo(bgView.mas_centerX);
        }];
    }
}

- (IBAction)qrCodeAction:(id)sender {
    if (self.itemBlock) {
        self.itemBlock(1);
    }
}
- (IBAction)setAction:(id)sender {
    if (self.itemBlock) {
        self.itemBlock(2);
    }
}
- (IBAction)showQrAction:(id)sender {
    if (self.itemBlock) {
        self.itemBlock(3);
    }
}
- (IBAction)changeAction:(id)sender {
    if (self.itemBlock) {
        self.itemBlock(4);
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
