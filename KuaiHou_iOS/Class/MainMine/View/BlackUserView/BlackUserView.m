//
//  BlackUserView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BlackUserView.h"


@implementation BlackUserView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"BlackUserView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
        [self.nameTextField setValue:kMain_TextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.phoneTextField setValue:kMain_TextColor forKeyPath:@"_placeholderLabel.textColor"];
        
    }
    return self;
}

@end
