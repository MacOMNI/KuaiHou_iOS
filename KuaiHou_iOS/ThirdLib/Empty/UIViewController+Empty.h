//
//  UIViewController+Empty.h
//  LetterBookProject
//
//  Created by 郭子豪 on 2018/12/8.
//  Copyright © 2018 LetterBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "PLEmptyViewFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Empty)

@property(nonatomic, strong)PLEmptyView* emptyView;

@end

NS_ASSUME_NONNULL_END
