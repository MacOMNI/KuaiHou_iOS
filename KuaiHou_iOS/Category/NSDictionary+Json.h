//
//  NSDictionary+Json.h
//  ParentChildShow
//
//  Created by 彭亮 on 2018/5/18.
//  Copyright © 2018年 亲子秀秀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (Json)

-(id)safe_objectForKey:(id)aKey;
-(NSString*)safe_stringForKey:(id)aKey;
-(NSString*)safe_stringValueForKey:(id)aKey;
-(NSInteger)safe_integerForKey:(id)aKey;
-(CGFloat)safe_floatForKey:(id)aKey;
-(long long int)safe_longlongintForKey:(id)aKey;

/**
 *  字典转 json字符串
 *
 *  @return json字符串
 */
-(NSString *)dictionaryToJsonString;
// 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;
@end
