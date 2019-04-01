//
//  FileCacheManager.h
//  UserAndMineProject
//
//  Created by 郭子豪 on 2018/10/7.
//  Copyright © 2018 LetterBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileCacheManager : NSObject

/**
 *  把对象归档存到沙盒里Cache路径下
 */
+ (BOOL)saveObject:(id)object byFileName:(NSString*)fileName;

/**
 *  通过文件名从沙盒中找到归档的对象
 */
+ (id)getObjectByFileName:(NSString*)fileName;

/**
 *  根据文件名删除沙盒中的归档对象
 */
+ (void)removeObjectByFileName:(NSString*)fileName;

/**
 *  存储用户偏好设置 到 NSUserDefults
 */
+ (void)saveUserData:(id)data forKey:(NSString*)key;

/**
 *  读取用户偏好设置
 */
+(id)readUserDataForKey:(NSString*)key;

/**
 *  删除用户偏好设置
 */
+(void)removeUserDataForkey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
