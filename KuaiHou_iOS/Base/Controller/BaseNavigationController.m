//
//  BaseNavigationController.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

+ (void)initialize {
    // 设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
}

+ (void)load{
    
    
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    dic[NSForegroundColorAttributeName] = kMain_TextColor;
    
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    UINavigationBar *bar;
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue >= 9.0) if (@available(iOS 9.0, *)) {
        bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    } else {
        // Fallback on earlier versions
    }
    else bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:dic];
    bar.tintColor = kMain_TextColor;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置分割线颜色
    [[UINavigationBar appearance] setShadowImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#eeeeee"]]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    viewController.navigationItem.backBarButtonItem = item;
    
    if (self.viewControllers.count > 0) {
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置左边的返回按钮
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Navc_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
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
