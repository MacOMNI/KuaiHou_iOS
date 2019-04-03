//
//  DIYMoreView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYMoreView.h"
#import "DIYReportView.h"

@implementation DIYMoreView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYMoreView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
    }
    return self;
}
- (IBAction)itemAction:(UIButton *)sender {
    if (sender.tag == 100) {
        [self hiddenView];
    }else{
        if (self.itmeBlock) {
            self.itmeBlock(sender.tag);
        }
    }
    
}

@end
