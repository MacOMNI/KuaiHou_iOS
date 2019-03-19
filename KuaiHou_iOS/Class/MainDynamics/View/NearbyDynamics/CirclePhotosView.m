//
//  CirclePhotosView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "CirclePhotosView.h"

#define PhotoMargin 15
#define PhotoMaxCol(count) ((count==4)?2:3)

@implementation CirclePhotosView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setPhotosArray:(NSArray *)photosArray {
    _photosArray = photosArray;
    NSUInteger photosCount = photosArray.count;
    while (self.subviews.count < photosCount) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor redColor];
        [MyTool fixCornerradius:imageView cornerRadius:5 Color:[UIColor clearColor] Width:0.5];
        [self addSubview:imageView];
    }
    
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i<self.subviews.count; i++) {
        UIImageView *imageView = self.subviews[i];
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        imageView.layer.masksToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
        [imageView addGestureRecognizer:tap];
        
        if (i < photosCount) { // 显示
            imageView.hidden = NO;
//            [MyTool sd_ImageView:imageView URLStr:photosArray[i] placeholderImage:@""];
        } else { // 隐藏
            imageView.hidden = YES;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger photosCount = self.photosArray.count;
    
    int maxCol = PhotoMaxCol(photosCount);
    
    for (int i = 0; i<photosCount; i++) {
        UIImageView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = 15 + col * ((kScreenSizeWidth-60)/3 + PhotoMargin);
        
        int row = i / maxCol;
        photoView.y = 5 + row * ((kScreenSizeWidth-60)/3 + PhotoMargin);
        photoView.width = (kScreenSizeWidth-60)/3;
        photoView.height = (kScreenSizeWidth-60)/3;
        //
        
    }
}

+ (CGSize)sizeWithCount:(NSUInteger)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = PhotoMaxCol(count);
    
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols *  (kScreenSizeWidth-60)/3 + (cols - 1) * PhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows *  (kScreenSizeWidth-60)/3 + (rows - 1) * PhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}

- (void)imageViewClick:(UIGestureRecognizer *)ges {
    if (self.clickTagBlock) {
        self.clickTagBlock(ges.view.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
