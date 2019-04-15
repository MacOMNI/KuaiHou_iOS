//
//  WhereToPlayDetailInfoUserListCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailInfoUserListCell.h"
#import "ChangeInfoHeadViewUserIconCell.h"
#import "AccessListVC.h"

@interface WhereToPlayDetailInfoUserListCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) int maxUserIconNum;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WhereToPlayDetailInfoUserListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.maxUserIconNum = (kScreenSizeWidth - 15) / 42;
    // Initialization code
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.dataArray = [NSMutableArray new];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ChangeInfoHeadViewUserIconCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ChangeInfoHeadViewUserIconCell class])];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
    return CGSizeMake(42, 32);
}

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


@end
