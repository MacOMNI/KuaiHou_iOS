//
//  BaseTableBar.m
//  ParentChildShow
//
//  Created by 亲子秀秀 on 2018/8/2.
//  Copyright © 2018年 亲子秀秀. All rights reserved.
//

#import "BaseTableBar.h"
#import <objc/runtime.h>

#define kMagin 5

@interface BaseTableBar ()



@end

@implementation BaseTableBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {

        
        self.backgroundColor = [UIColor clearColor];
        [self setShadowImage:[UIImage createImageWithColor:[UIColor clearColor]]];
        
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_send"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_send"] forState:UIControlStateHighlighted];
        self.plusBtn = plusBtn;
        
        
        [plusBtn addTarget:self action:@selector(plusBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:plusBtn];
        
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    Class class = NSClassFromString(@"UITabBarButton");
    
    self.plusBtn.centerX = self.centerX;
    //调整发布按钮的中线点Y值
    self.plusBtn.y = -(65)*0.2 - 5;
    
    self.plusBtn.size = CGSizeMake(65, 65);
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的五分之一
            btn.width = self.width / 5;
            
            btn.x = btn.width * btnIndex;
            
            btnIndex++;
            //如果是索引是2(从0开始的)，直接让索引++，目的就是让消息按钮的位置向右移动，空出来发布按钮的位置
            if (btnIndex == 2) {
                btnIndex++;
            }
            
        }
    }
    
    [self bringSubviewToFront:self.plusBtn];
    
    
}
//点击了发布按钮
- (void)plusBtnDidClick
{
    //如果tabbar的代理实现了对应的代理方法，那么就调用代理的该方法
    if ([self.mydelegate respondsToSelector:@selector(tabBarPlusBtnClick:)]) {
        [self.mydelegate tabBarPlusBtnClick:self];
    }
    
}

@end
