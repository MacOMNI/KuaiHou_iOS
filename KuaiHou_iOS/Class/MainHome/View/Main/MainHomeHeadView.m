//
//  MainHomeHeadView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainHomeHeadView.h"

@implementation MainHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self fixUI];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

-(void)fixUI{
    
}

- (void)scrollViewDidScroll:(CGFloat)offsetY {
    // headerView下拉放大
}

@end
