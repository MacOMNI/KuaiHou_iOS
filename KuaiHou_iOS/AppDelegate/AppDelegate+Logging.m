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
//    BOOL isAutoLogin = kUserInManagerSharedManager.isLogin;
//    if (isAutoLogin){
//        BOOL isUserId =  ![MyTool isBlankString:[kUserInManagerSharedManager.userId stringValue]];
//        [[NSNotificationCenter defaultCenter] postNotificationName:KAPPNOTIFICATION_LOGINCHANGE object:@(isUserId)];
//    }else{
//        [[NSNotificationCenter defaultCenter] postNotificationName:KAPPNOTIFICATION_LOGINCHANGE object:@NO];
//    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KAPPNOTIFICATION_LOGINCHANGE object:@YES];
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
//        [kUserInManagerSharedManager setLoginFlagWithIsLogin:loginSuccess];
        if (loginSuccess) {
            self.window.rootViewController = [[BaseTabBarController alloc] init];
        }else{
        }
//    }else{
//    }
}

@end
