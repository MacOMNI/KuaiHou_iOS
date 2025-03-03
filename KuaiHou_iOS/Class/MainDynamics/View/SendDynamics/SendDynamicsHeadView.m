//
//  SendDynamicsHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SendDynamicsHeadView.h"
#import "SendDynamicsHeadCell.h"

@interface SendDynamicsHeadView () <UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewH;
@property (weak, nonatomic) IBOutlet UILabel *wordNum;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SendDynamicsHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        self = [bundle loadNibNamed:@"SendDynamicsHeadView" owner:nil options:nil].lastObject;
        [self fixView];
    }
    return self;
}

-(void)fixView{
    _textView.xx_placeholder = @"此时此刻，我就想分享点什么";
    _textView.xx_placeholderFont = [UIFont systemFontOfSize:15];
    _textView.xx_placeholderColor = [UIColor colorWithHexString:@"#999999"];
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.textColor = [UIColor colorWithHexString:@"#333333"];
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    [self.collectionView setCollectionViewLayout:layout];
    
    NSBundle *bund=[NSBundle bundleForClass:[self class]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SendDynamicsHeadCell class]) bundle:bund] forCellWithReuseIdentifier:NSStringFromClass([SendDynamicsHeadCell class])];
}

- (void)textViewDidChange:(UITextView *)textView{
    
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    if (selectedRange && pos) {
        return;
    }
    NSUInteger count = textView.text.length;
    if (count>=200) {
        self.wordNum.text = @"200/200";
        textView.text = [textView.text substringToIndex:200];
    }else{
        self.wordNum.text = [NSString stringWithFormat:@"%ld/200", (unsigned long)count];
    }
    
    if (self.changeTextField) {
        self.changeTextField(textView);
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    return YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataArray.count == 0) {
        return 0;
    }
    if (self.dataArray.count < 9) {
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
        
        NSInteger count = imageArray.count < 9 ? imageArray.count + 1 : imageArray.count;
        if (imageArray.count == 0) {
            count = 0;
        }
        NSLog(@"%f ", [SendDynamicsHeadView sizeWithCount:count].height + 170);
        self.collectionViewH.constant = [SendDynamicsHeadView sizeWithCount:count].height;
        blockHeight([SendDynamicsHeadView sizeWithCount:count].height  + 170);
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
    //    if (self.selItemAction) {
    //        self.selItemAction(indexPath.row);
    //    }
}

@end
