//
//  AppUrlConfig.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppUrlConfig : NSObject

/** 融云通信 AppKey */
@property (nonatomic, copy) NSString *rongCloudAppkey;

/** 极光推送 YES为正式环境 NO为测试环境 */
@property (nonatomic, assign) BOOL isJPushProduction;

/** 友盟日志是否开启 YES为开启 NO不开启 */
@property (nonatomic, assign) BOOL isUMLog;

@property (nonatomic, strong) NSArray *urlArrays;

+ (instancetype)sharedManager;

- (NSInteger)urlIndex;

- (NSString *)name:(NSInteger)index;

- (NSString *)baseUrl:(NSInteger)index;


// UserDefaultSetIntegerForKey(indexPath.row, URLINDEX); 

@end

NS_ASSUME_NONNULL_END
