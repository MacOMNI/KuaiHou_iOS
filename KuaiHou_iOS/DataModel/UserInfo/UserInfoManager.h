//
//  UserInfoManager.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kUserInfoSharedManager [UserInfoManager sharedManager]

@interface UserInfoManager : NSObject

+ (instancetype)sharedManager;

/**
 *  退出
 */
- (void)didLoginOut;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;
-(void)setLoginFlagWithIsLogin:(BOOL)isLogin;

@end

NS_ASSUME_NONNULL_END
