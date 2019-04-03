//
//  TheOrderActivityVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "TheOrderActivityVC.h"
#import "SendDynamicsHeadCell.h"

@interface TheOrderActivityVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TheOrderActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"此单活动";
    [self fixUI];
}

-(void)fixUI{
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
    return 6;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kScreenSizeWidth- 60) / 3;
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SendDynamicsHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class]) forIndexPath:indexPath];
    
    cell.delBtn.hidden = YES;

    return cell;
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
