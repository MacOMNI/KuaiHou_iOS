//
//  AppDelegate+Logging.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppDelegate+Logging.h"
#import "BaseTabBarController.h"
#import "LogginVC.h"
#import "BaseNavigationController.h"

@implementation AppDelegate (Logging)

-(void)regisLogginConfig{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[IQKeyboardManager sharedManager] setToolbarDoneBarButtonItemText:@"确定"];
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KAPPNOTIFICATION_LOGINCHANGE
                                               object:nil];
    BOOL isAutoLogin = kUserInfoSharedManager.isLogin;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KAPPNOTIFICATION_LOGINCHANGE object:@(isAutoLogin)];
}

#pragma mark 登录状态发生改变
- (void)loginStateChange:(NSNotification *)notification{
    //判断是不是第一次启动应用/新版本
//    NSString *key = @"CFBundleShortVersionString";
    // 上一次的使用版本（存储在沙盒中的版本号）
//    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
//    if ([currentVersion isEqualToString:lastVersion]) {
        // 是否是登录成功的通知
        BOOL loginSuccess = [notification.object boolValue];
        // 保存登录状态
        [kUserInfoSharedManager setLoginFlagWithIsLogin:loginSuccess];
        if (loginSuccess) {
            self.window.rootViewController = [[BaseTabBarController alloc] init];
        }else{
            LogginVC *loggin = [LogginVC new];
            BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:loggin];
            self.window.rootViewController = nav;
        }
//    }else{
//    }
}


- (void)loadLaunchImageView{
    CGSize viewSize = [MyTool getCurrentVC].view.bounds.size;
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImage = nil;
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = [MyTool getCurrentVC].view.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [[MyTool getCurrentVC].view addSubview:launchView];
    
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         launchView.alpha = 0.0f;
                         launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [launchView removeFromSuperview];
                         
                     }];
}

@end
