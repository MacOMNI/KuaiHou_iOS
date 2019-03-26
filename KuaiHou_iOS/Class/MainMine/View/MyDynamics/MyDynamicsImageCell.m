//
//  MyDynamicsImageCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyDynamicsImageCell.h"
#import "MyDynamicsPhotosView.h"

@interface MyDynamicsImageCell()

/// 图片
@property (nonatomic, strong) MyDynamicsPhotosView *photosView;


@end

@implementation MyDynamicsImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubView];
    }
    return self;
}

-(void)createSubView{
    __weak typeof(self) weakSelf = self;
    self.photosView = [[MyDynamicsPhotosView alloc] init];
    self.photosView.clickTagBlock = ^(NSInteger tag) {
        if (weakSelf.pictureTagBlock) {
            weakSelf.pictureTagBlock(tag);
        }
    };
    [self.contentView addSubview:self.photosView];
}

- (void)setCircleModelImageCount:( int )count {
    
    CGSize size = [MyDynamicsPhotosView sizeWithCount:count];
    self.photosView.frame = CGRectMake(0, 0, size.width, size.height);
    NSMutableArray *dataArray = [NSMutableArray new];
    for (int i = 0; i < count; i ++) {
        [dataArray addObject:@""];
    }
    self.photosView.photosArray = dataArray;
}

- (void)setCircleModelImageArray:( NSArray * )dataArray{
    CGSize size = [MyDynamicsPhotosView sizeWithCount:dataArray.count];
    self.photosView.frame = CGRectMake(0, 0, size.width, size.height);
    self.photosView.photosArray = dataArray;
}

+(CGFloat)cellHeightWithImageCount:( int )count {
    if (count > 0) {
        CGSize size = [MyDynamicsPhotosView sizeWithCount:count];
        return size.height + 10;
    }
    return 0;
}

@end
