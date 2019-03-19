//
//  BaseTabBarController.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"

#import "MainHomeVC.h"
#import "MainDynamicsVC.h"
#import "MainMessageVC.h"
#import "MainMineVC.h"

@interface BaseTabBarController ()<UITabBarControllerDelegate,BaseTabBarDelegate>

@property (nonatomic, strong) BaseTableBar *tabbar;
@end

@implementation BaseTabBarController

+ (void)initialize {
    // 设置为不透明
    [UITabBar appearance].translucent = NO;
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    // 普通状态
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont fontWithName:@"PingFangSC-Medium" size:10]
                                  , NSFontAttributeName,
                                  kMain_TextColor,NSForegroundColorAttributeName,
                                  nil] forState:UIControlStateNormal];
    // 选中状态
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont fontWithName:@"PingFangSC-Medium" size:10]
                                  ,NSFontAttributeName,
                                  kMainColor,NSForegroundColorAttributeName,
                                  nil] forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self initBaseTabBar];
}

#pragma mark 初始化自定义tabbar
-(void)initBaseTabBar{
    
    [self addChildViewControllerWithClassName:[MainHomeVC description] imageName:@"tabbar_homeN" selectimageName:@"tabbar_homeS" title:@"首页"];
    [self addChildViewControllerWithClassName:[MainDynamicsVC description] imageName:@"tabbar_dynamicsN" selectimageName:@"tabbar_dynamicsS" title:@"动态"];
    [self addChildViewControllerWithClassName:[MainMessageVC description] imageName:@"tabbar_messageN" selectimageName:@"tabbar_messageS" title:@"消息"];
    [self addChildViewControllerWithClassName:[MainMineVC description] imageName:@"tabbar_mineN" selectimageName:@"tabbar_mineS" title:@"我的"];
    
    
    self.tabbar = [[BaseTableBar alloc] init];
    self.tabbar.mydelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:self.tabbar forKeyPath:@"tabBar"];
}

#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(BaseTableBar *)tabBar{
}

// 添加子控制器
- (void)addChildViewControllerWithClassName:(NSString *)className
                                  imageName:(NSString *)imageName
                            selectimageName:(NSString *)selectimageName
                                      title:(NSString *)title {
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.navigationItem.title = title;
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectimageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
