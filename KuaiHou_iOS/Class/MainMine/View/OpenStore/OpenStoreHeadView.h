//
//  OpenStoreHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenStoreHeadView : BaseView

typedef void (^blockHeight)(CGFloat height);

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewH;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, copy) void (^delBlock) (NSInteger indexRow);

@property (nonatomic, copy) void (^selectItem) (BOOL isAdd, NSUInteger indexRow);

-(void)reloadDataWithImageArray:(NSArray *)imageArray blockHeight:(blockHeight)blockHeight;

@end

NS_ASSUME_NONNULL_END
