//
//  UIViewController+FLInsert.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "UIViewController+FLInsert.h"

@implementation UIViewController (VFInsert)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector= @selector(FL_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
    });
}

- (void)FL_viewWillAppear:(BOOL)animated {
    
    [self FL_viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]) {
            scrollView = (UIScrollView *)view;
            break;
        }
    }
    if (!self.automaticallyAdjustsScrollViewInsets) {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        }
    }
}

- (void)FL_setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets {
    
    [self FL_setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
    
}

@end
