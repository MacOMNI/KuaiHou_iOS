//
//  MyVideoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyVideoVC.h"
#import "SendDynamicsHeadCell.h"

@interface MyVideoVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MyVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.dataArray = [NSMutableArray new];
    for (int i = 0; i < 30; i ++) {
        [self.dataArray addObject:@(i)];
    }
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    [self.collectionView setCollectionViewLayout:layout];
    
    NSBundle *bund=[NSBundle bundleForClass:[self class]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SendDynamicsHeadCell class]) bundle:bund] forCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class])];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count + 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kScreenSizeWidth- 45) / 2;
    return CGSizeMake(width, width * 225.0 / 165.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SendDynamicsHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class]) forIndexPath:indexPath];
    if (indexPath.row < self.dataArray.count) {
        cell.imageView.image = [UIImage new];
        cell.delBtn.hidden = NO;
    }else{
        cell.imageView.image = [UIImage loadImageWithName:@"dynamics_addphoto"];
        cell.delBtn.hidden = YES;
    }
    
    cell.delBlock = ^{
    };
    
    return cell;
}

#pragma mark - GKPageListViewDelegate
- (UIScrollView *)listScrollView {
    return self.collectionView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView * _Nonnull))callback {
    self.listScrollViewDidScroll = callback;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.listScrollViewDidScroll ? : self.listScrollViewDidScroll(scrollView);
}


@end
