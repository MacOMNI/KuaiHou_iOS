//
//  AppCurrencyItemCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppCurrencyItemCell.h"
#import "AppCurrencyItemCollectionViewCell.h"

@implementation AppCurrencyItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 15;
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AppCurrencyItemCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([AppCurrencyItemCollectionViewCell class])];
}

-(void)reloadDataByArray:(NSArray *)dataArray{
    self.dataArray = [NSMutableArray arrayWithArray:dataArray];
    [self.collectionView reloadData];
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    MAIN(^{
        [self.collectionView reloadData];
    });
    
}

// 每个分区上得元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AppCurrencyItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AppCurrencyItemCollectionViewCell class]) forIndexPath:indexPath];
    
    if (indexPath.row == self.currentIndex) {
        cell.bgView.backgroundColor = kMainColor;
        cell.titleLab.textColor = [UIColor whiteColor];
        cell.detailLab.textColor = [UIColor whiteColor];
    }else{
        cell.bgView.backgroundColor = [UIColor whiteColor];
        cell.titleLab.textColor = kMainColor;
        cell.detailLab.textColor = [UIColor colorWithHexString:@"#FFA096"];
    }
    
    return cell;
}
// 设置UIcollectionView整体的内边距（这样item不贴边显示）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 上 左 下 右
    return UIEdgeInsetsMake(0, 15, 15, 15);
}

// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat weidth = (kScreenSizeWidth - 60) / 3;
    return CGSizeMake(weidth, 60);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndex = indexPath.row;
    if (self.itemBlock) {
        self.itemBlock(self.currentIndex);
    }
}

+(CGFloat)getHeightByCount:(NSInteger)count{
    CGFloat height = 15;
    if (count == 0) {
        return height;
    }
    height = ceil(count / 3.0) * 75;
    return height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
