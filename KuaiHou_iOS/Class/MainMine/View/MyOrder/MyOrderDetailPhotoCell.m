//
//  MyOrderDetailPhotoCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyOrderDetailPhotoCell.h"
#import "PhotoListCollectionViewCell.h"

@interface MyOrderDetailPhotoCell() <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation MyOrderDetailPhotoCell

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
    [self registerNibWithTableView];
}

// 注册cell
- (void)registerNibWithTableView {
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([PhotoListCollectionViewCell class])];
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
    
    PhotoListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PhotoListCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

// 设置UIcollectionView整体的内边距（这样item不贴边显示）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 上 左 下 右
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

// 设置minimumInteritemSpacing：cell左右之间最小的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(130, 200);
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
