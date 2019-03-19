//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import "PLEmptyConfig.h"
@implementation PLEmptyConfig

-(instancetype)init
{
    if (self = [super init]) {
        self.emptyCenterOffset = 0;
        self.emptySpaceHeight = 20;
        self.emptyImageTopMargin = 0;
        self.emptyTitleTopMargin = 30;
        self.emptySubTitleTopMargin = 15;
        self.emptyBtnTopMargin = 20;
        self.allowScroll = YES;
    }
    return self;
}

-(NSString *)emptyTitle
{
    return _emptyTitle?:@"";
}
- (NSString *)emptySubtitle
{
    return _emptySubtitle?:@"";
}

- (UIFont *)emptyTitleFont
{
    return _emptyTitleFont ?: [UIFont systemFontOfSize:16.0f];
}
- (UIFont *)emptySubTitleFont
{
    return _emptySubTitleFont?: [UIFont systemFontOfSize:15.0f];
}
- (UIFont *)emptyBtnTitleFont
{
    return _emptyBtnTitleFont?:[UIFont systemFontOfSize:16.0f];
}

-(UIColor *)emptyTitleColor
{
    return _emptyTitleColor?:[UIColor colorWithHexString:@"#666666"];
}
- (UIColor *)emptySubTitleColor
{
    return _emptySubTitleColor ?: [UIColor colorWithHexString:@"#969696"];
}
- (UIColor *)emptyBtnTileColor
{
    return _emptyBtnTileColor ?: [UIColor redColor];
}

- (UIImage *)emptyBtnImage
{
    return _emptyBtnImage ?: [UIImage imageNamed:@"empty_button"];
}

- (CGSize)emptyImageSize
{
    if (_emptyImageSize.height<=0||_emptyImageSize.width<=0) {
        return CGSizeMake(100, 100);
    }else
    {
        return _emptyImageSize;
    }
}

- (UIColor *)emptyBtnBgColor
{
    return _emptyBtnBgColor?: [UIColor clearColor];
}

@end
