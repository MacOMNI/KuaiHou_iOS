//
//  WhereConsumeCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereConsumeCell.h"
#import "WhereConsumeFirstCell.h"
#import "WhereConsumeTwoCell.h"

@interface WhereConsumeCell() <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation WhereConsumeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    /// 设置此属性为yes 不满一屏幕 也能滚动
    self.collectionView.alwaysBounceHorizontal = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.collectionViewLayout = layout;
//    [self registerNibWithTableView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WhereConsumeFirstCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([WhereConsumeFirstCell class])];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WhereConsumeTwoCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([WhereConsumeTwoCell class])];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - 代理方法 Delegate Methods
// 设置分区

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个分区上得元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// 设置cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == 0) {
        WhereConsumeFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WhereConsumeFirstCell class]) forIndexPath:indexPath];
        return cell;
    }else if (self.type == 1){
        WhereConsumeTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WhereConsumeTwoCell class]) forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

// 设置UIcollectionView整体的内边距（这样item不贴边显示）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 上 左 下 右
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

// 设置minimumInteritemSpacing：cell左右之间最小的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == 0) {
        return CGSizeMake(120, 130);
    }
    else if (self.type == 1){
        return CGSizeMake(120, 210);
    }
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectItemBlock) {
        self.selectItemBlock(indexPath.row);
    }
}

@end
