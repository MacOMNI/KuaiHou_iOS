//
//  ChangeInfoHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ChangeInfoHeadView.h"
#import "ChangeInfoHeadViewUserIconCell.h"
#import "AccessListVC.h"


@interface ChangeInfoHeadView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) int maxUserIconNum;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ChangeInfoHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.maxUserIconNum = (kScreenSizeWidth - 15) / 47;
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
            make.size.mas_equalTo(CGSizeMake(14, 14));
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
            make.right.equalTo(self.mas_right).offset(0);
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
        frame.size.height = self.bgImgH - offsetY;
//        frame.origin.y = -(self.bgImgH - kScreenSizeWidth);
        frame.origin.y = offsetY;
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
        _sexImageView.image = [UIImage loadImageWithName:@"sex_woman"];
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

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.collectionViewLayout = layout;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ChangeInfoHeadViewUserIconCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ChangeInfoHeadViewUserIconCell class])];
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

#pragma mark - 代理方法 Delegate Methods
// 设置分区

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个分区上得元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.dataArray.count > 0) {
        if (self.dataArray.count < self.maxUserIconNum) {
            return self.dataArray.count + 1;
        }else{
            return self.maxUserIconNum;
        }
    }
    return 0;
    
}
// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(47, 32);
}

// 设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ChangeInfoHeadViewUserIconCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ChangeInfoHeadViewUserIconCell class]) forIndexPath:indexPath];
    if (self.dataArray.count < self.maxUserIconNum) {
        cell.headImageView.hidden = indexPath.row == self.dataArray.count;
        cell.more_icon.hidden = indexPath.row != self.dataArray.count;
    }else{
        cell.headImageView.hidden = indexPath.row == self.maxUserIconNum - 1;
        cell.more_icon.hidden = indexPath.row != self.maxUserIconNum - 1;
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count < self.maxUserIconNum) {
        if (indexPath.row == self.dataArray.count) {
            NSLog(@"查看列表");
            [[MyTool getCurrentVC].navigationController pushViewController:[AccessListVC new] animated:YES];
//            [self reloadViewByArray:@[@"",@""]];
        }else{
            NSLog(@"点击了头像");
        }
    }else{
        if (indexPath.row == self.maxUserIconNum - 1) {
            NSLog(@"查看列表");
            [[MyTool getCurrentVC].navigationController pushViewController:[AccessListVC new] animated:YES];
        }else{
            NSLog(@"点击了头像");
        }
    }
    
}

-(void)reloadViewByArray:(NSArray *)dataArray{
    self.dataArray = [[NSMutableArray alloc] initWithArray:dataArray];
    
    [UIView transitionWithView:self.collectionView
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void){
                        [self.collectionView reloadData];
                    }
                    completion: ^(BOOL isFinished){
                        
                    }];
    [self.collectionView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
