//
//  UserInfoManager.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "UserInfoManager.h"
#import "FileCacheManager.h"

#define kLoginFlag @"loginFlag"
static UserInfoManager *_singleton = nil;

@implementation UserInfoManager

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[UserInfoManager alloc] init];
    });
    return _singleton;
}

-(void)setLoginFlagWithIsLogin:(BOOL)isLogin{
    [FileCacheManager saveUserData:[NSNumber numberWithBool:isLogin] forKey:kLoginFlag];
}

// 退出登陆
- (void)didLoginOut {
//    [FileCacheManager removeObjectByFileName:NSStringFromClass([LoginUserInfo_DataInfoModel class])];
    [FileCacheManager saveUserData:@NO forKey:kLoginFlag];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KAPPNOTIFICATION_LOGINCHANGE object:@NO];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kLoginFlag];
}

@end
