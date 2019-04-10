//
//  DIYPayView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYPayView.h"

@implementation DIYPayView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYPayView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        self.currentIndex = 0;
    }
    return self;
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}
- (IBAction)commitAction:(UIButton *)sender {
    [self hiddenView];
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    self.wechatIcon.selected = currentIndex == self.wechatIcon.tag;
    self.alipayIcon.selected = currentIndex == self.alipayIcon.tag;
    
}
- (IBAction)itemAction:(UIButton *)sender {
    self.currentIndex = sender.tag;
}


@end
