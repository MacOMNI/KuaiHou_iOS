//
//  LiquorImageDataVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "LiquorImageDataVC.h"
#import "LiquorImageDataCell.h"

@interface LiquorImageDataVC () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation LiquorImageDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 15;
//    layout.minimumInteritemSpacing = 15;
    self.collectionView.collectionViewLayout = layout;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LiquorImageDataCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([LiquorImageDataCell class])];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
-(void)rightAction{
    
}

// 每个分区上得元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LiquorImageDataCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LiquorImageDataCell class]) forIndexPath:indexPath];
    
    return cell;
}

// 设置UIcollectionView整体的内边距（这样item不贴边显示）
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 上 左 下 右
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

// 设置cell大小 itemSize：可以给每一个cell指定不同的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat weidth = (kScreenSizeWidth - 60) / 3;
    return CGSizeMake(weidth, weidth + 25);
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
