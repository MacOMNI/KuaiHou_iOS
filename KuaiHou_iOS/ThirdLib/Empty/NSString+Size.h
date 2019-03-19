//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

-(CGSize)textSizeWithLineSpacing:(CGFloat)lineSpacing font:(UIFont*)font constrainedToSize:(CGSize)size ;
@end
