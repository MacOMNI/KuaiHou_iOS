//
//  NSDictionary+Json.m
//  ParentChildShow
//
//  Created by 彭亮 on 2018/5/18.
//  Copyright © 2018年 亲子秀秀. All rights reserved.
//

#import "NSDictionary+Json.h"

@implementation NSDictionary (Json)


/**
*  字典转 json字符串
*
*  @return json字符串
*/
-(NSString *)dictionaryToJsonString
{
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

}

-(id)safe_objectForKey:(id)aKey{
    id value = [self objectForKey:aKey];
    if ([value class] == [NSNull class]) {
        return nil;
    }
    if (!value) {
        return nil;
    }
    if ([value isEqual:[NSNull null]]) {
        return nil;
    }
    return value;
}

-(NSString*)safe_stringForKey:(id)aKey{
    id value = [self objectForKey:aKey];
    if (!value) {
        return nil;
    }
    if ([value isEqual:[NSNull null]]) {
        return nil;
    }
    return [NSString stringWithFormat:@"%@",value];
}


-(NSString*)safe_stringValueForKey:(id)aKey{
    id value = [self objectForKey:aKey];
    if (!value) {
        return @"";
    }
    if ([value isEqual:[NSNull null]]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",value];
    
}

-(NSInteger)safe_integerForKey:(id)aKey{
    NSString *value = [self safe_stringForKey:aKey];
    if ([self isPureInt:value]) {
        return [value integerValue];
    }
    return 0;
}

-(CGFloat)safe_floatForKey:(id)aKey{
    NSString *value = [self safe_stringForKey:aKey];
    if ([self isPureInt:value]) {
        return [value floatValue];
    }
    return 0;
}

-(long long int)safe_longlongintForKey:(id)aKey{
    NSString *value = [self safe_stringForKey:aKey];
    if ([self isPureInt:value]) {
        return [value longLongValue];
    }
    return 0;
}

- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


- (BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
// 读取本地JSON文件
+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle bundleForClass:NSClassFromString(@"MyTool")] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
}



@end
