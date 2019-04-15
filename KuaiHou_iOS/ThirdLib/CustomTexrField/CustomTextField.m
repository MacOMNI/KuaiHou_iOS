//
//  CustomTextField.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15;// 右偏25
    return iconRect;
}
//

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super textRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    iconRect.size.width-=10;
    return iconRect;
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super editingRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
}

@end
