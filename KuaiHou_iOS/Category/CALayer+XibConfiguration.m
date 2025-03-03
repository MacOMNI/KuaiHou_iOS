//
//  CALayer+XibConfiguration.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)



- (void)setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}


- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}


-(void)setShadowUIColor:(UIColor*)color {
    self.shadowColor = color.CGColor;
}

-(UIColor *)shadowUIColor {
    return [UIColor colorWithCGColor:self.shadowColor];
}

@end
