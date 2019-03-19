//
//  AppUrlConfig.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppUrlConfig.h"


static AppUrlConfig* _urlConfig = nil;

@implementation AppUrlConfig

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _urlConfig = [[AppUrlConfig alloc] init];
    });
    return _urlConfig;
}

- (NSString *)rongCloudAppkey {
    if ([[self baseUrl:self.urlIndex] isEqualToString:@"http://ms.qinzixx.com"]) {
        return @"正式的key";    // 融云正式服key
    }
    return @"dev的key";    // 融云测试服key
}

- (BOOL)isJPushProduction {
    if ([[self baseUrl:self.urlIndex] isEqualToString:@"http://ms.qinzixx.com"]) {
        return YES;
    }
    return NO;
}

- (BOOL)isUMLog {
    if ([[self baseUrl:self.urlIndex] isEqualToString:@"http://ms.qinzixx.com"]) {
        return NO;
    }
    return YES;
}

- (NSString *)name:(NSInteger)index {
    return self.urlArrays[index][@"name"];
}

- (NSString *)baseUrl:(NSInteger)index {
    return self.urlArrays[index][@"BaseUrl"];
}

- (NSInteger)urlIndex {
#ifdef DEBUG
    return UserDefaultIntegerForKey(URLINDEX);
#else
    return DISINDEX;
#endif
}

- (NSArray *)urlArrays {
    NSArray *array = @[
                       @{@"BaseUrl": @"http://dev.qinzixx.com", @"name":@"Dev环境"},
                       @{@"BaseUrl": @"http://ms.qinzixx.com", @"name":@"正式环境"},
                       ];
    return array;
}

@end
