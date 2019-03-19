//
//  ApiConfig.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#ifndef ApiConfig_h
#define ApiConfig_h

#pragma mark **********************环境切换**********************

#define URLINDEX @"urlIndex"
#define DISINDEX 1
#define BASE_URL(urlDetail) [NSString stringWithFormat:@"%@%@", [[AppUrlConfig sharedManager] baseUrl:[[AppUrlConfig sharedManager] urlIndex]], urlDetail]

#pragma mark **********************环境切换**********************


#pragma mark **********************登录定义**********************

//登录判断
#define kLoginFlag @"loginFlag"
//登录状态变化通知
#define KAPPNOTIFICATION_LOGINCHANGE @"AppLoginStateChange"
// 用户登录账号
#define kUserLoginAccounts @"UserLoginAccounts"
// 用户登录密码
#define kUserLoginPassWord @"UserLoginPassWord"

#pragma mark **********************登录定义**********************


#pragma mark **********************主题定义**********************

// 主题颜色
#define kMainColor [UIColor colorWithHexString:@"#E24333"]
// 字体主色
#define kMain_TextColor [UIColor colorWithHexString:@"#333333"]
#define kMain_TextColor_5 [UIColor colorWithHexString:@"#555555"]
#define kMain_TextColor_6 [UIColor colorWithHexString:@"#666666"]
#define kMain_TextColor_9 [UIColor colorWithHexString:@"#999999"]
// 分割线主色
#define kMain_lineColor [UIColor colorWithHexString:@"#EEEEEE"]
#define kMain_lineColor_C [UIColor colorWithHexString:@"#CCCCCC"]

#pragma mark **********************主题定义**********************


#endif /* ApiConfig_h */
