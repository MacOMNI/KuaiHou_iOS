//
//  NearByDynamicsImageCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "NearByDynamicsImageCell.h"
#import "CirclePhotosView.h"

@interface NearByDynamicsImageCell()

/// 图片
@property (nonatomic, strong) CirclePhotosView *photosView;


@end

@implementation NearByDynamicsImageCell

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
    self.photosView = [[CirclePhotosView alloc] init];
    self.photosView.clickTagBlock = ^(NSInteger tag) {
        if (weakSelf.pictureTagBlock) {
            weakSelf.pictureTagBlock(tag);
        }
    };
    [self.contentView addSubview:self.photosView];
}

- (void)setCircleModelImageCount:( int )count {
    
    CGSize size = [CirclePhotosView sizeWithCount:count];
    self.photosView.frame = CGRectMake(0, 0, size.width, size.height);
    NSMutableArray *dataArray = [NSMutableArray new];
    for (int i = 0; i < count; i ++) {
        [dataArray addObject:@""];
    }
    self.photosView.photosArray = dataArray;
}

- (void)setCircleModelImageArray:( NSArray * )dataArray{
    CGSize size = [CirclePhotosView sizeWithCount:dataArray.count];
    self.photosView.frame = CGRectMake(0, 0, size.width, size.height);
    self.photosView.photosArray = dataArray;
}

+(CGFloat)cellHeightWithImageCount:( int )count {
    if (count > 0) {
        CGSize size = [CirclePhotosView sizeWithCount:count];
        return size.height + 10;
    }
    return 0;
}

@end
