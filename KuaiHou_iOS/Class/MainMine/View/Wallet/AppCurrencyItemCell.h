//
//  AppCurrencyItemCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCurrencyItemCell : BaseCell <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) void (^itemBlock)(NSInteger index);

-(void)reloadDataByArray:(NSArray *)dataArray;

+(CGFloat)getHeightByCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
