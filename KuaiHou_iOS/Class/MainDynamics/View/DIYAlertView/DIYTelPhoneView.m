//
//  DIYTelPhoneView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYTelPhoneView.h"

@implementation DIYTelPhoneView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYTelPhoneView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
    }
    return self;
}
- (IBAction)cancle:(id)sender {
    [self hiddenView];
    if (self.cancleBlock) {
        self.cancleBlock();
    }
}
- (IBAction)commitAction:(id)sender {
    
    [self hiddenView];
    
    
    
    if (self.commitBlock) {
        self.commitBlock();
    }
    
}

@end
