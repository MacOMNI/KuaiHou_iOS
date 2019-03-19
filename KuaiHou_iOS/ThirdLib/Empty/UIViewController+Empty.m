//
//  UIViewController+Empty.m
//  LetterBookProject
//
//  Created by 郭子豪 on 2018/12/8.
//  Copyright © 2018 LetterBook. All rights reserved.
//

#import "UIViewController+Empty.h"

@implementation UIViewController (Empty)

//定义常量 必须是C语言字符串
static NSString *emptyViewKey = @"emptyViewKey";

-(void)setEmptyView:(PLEmptyView *)emptyView{
    objc_setAssociatedObject(self, &emptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN);
}

-(PLEmptyView *)emptyView{
    return objc_getAssociatedObject(self, &emptyViewKey);
}

@end
