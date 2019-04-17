//
//  DIYConsumeTypeView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/16.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYConsumeTypeView.h"

@implementation DIYConsumeTypeView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYConsumeTypeView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 450;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
    }
    return self;
}

@end
