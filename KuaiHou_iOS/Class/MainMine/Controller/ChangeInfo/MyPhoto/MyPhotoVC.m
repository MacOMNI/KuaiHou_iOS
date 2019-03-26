//
//  MyPhotoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyPhotoVC.h"
#import "SendDynamicsHeadCell.h"

@interface MyPhotoVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MyPhotoVC

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
    CGFloat width = (kScreenSizeWidth- 60) / 3;
    return CGSizeMake(width, width);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
