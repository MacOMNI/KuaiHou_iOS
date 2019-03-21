//
//  SendDynamicsHeadView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseView.h"
#import "XXTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SendDynamicsHeadView : BaseView
// 下拉刷新
typedef void (^blockHeight)(CGFloat height);

@property (weak, nonatomic) IBOutlet XXTextView *textView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (nonatomic, copy) void (^selectItem) (BOOL isAdd, NSUInteger indexRow);
@property (nonatomic, copy) void (^delBlock) (NSInteger indexRow);
@property (nonatomic, copy) void (^changeTextField) (UITextView *textView);

-(void)reloadDataWithImageArray:(NSArray *)imageArray blockHeight:(blockHeight)blockHeight;



@end

NS_ASSUME_NONNULL_END
