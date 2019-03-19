//
//  BaseTableBar.h
//  ParentChildShow
//
//  Created by 亲子秀秀 on 2018/8/2.
//  Copyright © 2018年 亲子秀秀. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTableBar;

@protocol BaseTabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(BaseTableBar *)tabBar;
@end

@interface BaseTableBar : UITabBar

/** plus按钮 */
@property (nonatomic, weak) UIButton *plusBtn ;

/** tabbar的代理 */
@property (nonatomic, weak) id<BaseTabBarDelegate> mydelegate ;



@end
