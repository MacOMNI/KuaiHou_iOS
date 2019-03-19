//
//  BaseTabBarController.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController

//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(BaseTableBar *)tabBar;

@end

NS_ASSUME_NONNULL_END
