//
//  CleanChatView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "CleanChatView.h"

@interface CleanChatView ()


@end

@implementation CleanChatView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"CleanChatView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 175;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
    }
    return self;
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}
- (IBAction)okerAction:(id)sender {
    if (self.commitBlock) {
        self.commitBlock();
    }
    [self hiddenView];
}

@end
