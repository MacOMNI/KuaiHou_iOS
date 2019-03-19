//
//  UIColor+Hex.h
//  OpenMIG
//
//  Created by duanzhijun on 2016/10/27.
//  Copyright © 2016年 Sian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (instancetype)colorWithHex:(int)hexNumber alpha:(CGFloat)alpha;
+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
