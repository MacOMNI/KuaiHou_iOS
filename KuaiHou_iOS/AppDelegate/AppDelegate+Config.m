//
//  AppDelegate+Config.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppDelegate+Config.h"

@implementation AppDelegate (Config)

-(void)initTABViewAnimat{
    // 简单的示例
    [[TABViewAnimated sharedAnimated]initWithOnlySkeleton];
}

@end
