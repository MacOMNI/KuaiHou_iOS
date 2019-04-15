//
//  WhereToPlayDetailInfoHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailInfoHeadView.h"

@implementation WhereToPlayDetailInfoHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        self = [bundle loadNibNamed:@"WhereToPlayDetailInfoHeadView" owner:nil options:nil].lastObject;
        self.backgroundColor = [UIColor whiteColor];
//        [self fixView];
    }
    return self;
}

@end
