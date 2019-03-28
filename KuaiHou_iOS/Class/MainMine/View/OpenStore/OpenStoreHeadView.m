//
//  OpenStoreHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenStoreHeadView.h"
#import "SendDynamicsHeadCell.h"

@interface OpenStoreHeadView () <UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation OpenStoreHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        self = [bundle loadNibNamed:@"OpenStoreHeadView" owner:nil options:nil].lastObject;
        [self fixView];
    }
    return self;
}

-(void)fixView{
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    [self.collectionView setCollectionViewLayout:layout];
    
    NSBundle *bund=[NSBundle bundleForClass:[self class]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SendDynamicsHeadCell class]) bundle:bund] forCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class])];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    if (self.dataArray.count == 0) {
//        return 0;
//    }
    if (self.dataArray.count < 6) {
        return self.dataArray.count + 1;
    }
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kScreenSizeWidth- 60) / 3;
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SendDynamicsHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class]) forIndexPath:indexPath];
    if (indexPath.row < self.dataArray.count) {
        cell.imageView.image = self.dataArray[indexPath.row];
    }else{
        cell.imageView.image = [UIImage loadImageWithName:@"dynamics_addphoto"];
    }
    cell.delBtn.hidden = indexPath.row == self.dataArray.count;
    cell.delBlock = ^{
        if (self.delBlock) {
            self.delBlock(indexPath.row);
        }
    };
    return cell;
}

-(void)reloadDataWithImageArray:(NSArray *)imageArray blockHeight:(blockHeight)blockHeight{
    self.dataArray = [NSMutableArray arrayWithArray:imageArray];
    [self.collectionView reloadData];
    MAIN(^{
        NSInteger count = imageArray.count < 6 ? imageArray.count + 1 : imageArray.count;
        NSLog(@"%f ", [OpenStoreHeadView sizeWithCount:count].height + 45);
        self.collectionViewH.constant = [OpenStoreHeadView sizeWithCount:count].height;
        blockHeight([OpenStoreHeadView sizeWithCount:count].height  + 45);
    });
}

+ (CGSize)sizeWithCount:(NSUInteger)count
{
    if (count == 0) {
        return CGSizeMake(0, 0);
    }
    // 最大列数（一行最多有多少列）
    int maxCols = 3;
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols *  (kScreenSizeWidth-60)/3 + (cols - 1) * 15;
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows *  (kScreenSizeWidth-60)/3 + (rows - 1) * 15;
    return CGSizeMake(photosW, photosH);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.selectItem) {
        self.selectItem(indexPath.row == self.dataArray.count, (long)indexPath.row);
    }
}

@end
