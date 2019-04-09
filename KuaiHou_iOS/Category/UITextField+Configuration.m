//
//  UITextField+Configuration.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "UITextField+Configuration.h"

@implementation UITextField (Configuration)

-(void)setPlaceholderDIYColor:(UIColor *)placeholderDIYColor{
    [self setValue:placeholderDIYColor forKeyPath:@"_placeholderLabel.textColor"];
}

-(UIColor *)placeholderDIYColor{
    return self.placeholderDIYColor;
}

-(void)setPlaceholderDIYFont:(UIFont *)placeholderDIYFont{
    [self setValue:placeholderDIYFont forKeyPath:@"_placeholderLabel.font"];
}

-(UIFont *)placeholderDIYFont{
    return self.placeholderDIYFont;
}

@end
