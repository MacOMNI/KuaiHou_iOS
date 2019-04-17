//
//  DIYShareView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/16.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYShareView.h"

@implementation DIYShareView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYShareView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        [MyTool fixTopImageBtn:self.wechatBtn Spacing:5];
        [MyTool fixTopImageBtn:self.wechatSbtn Spacing:5];
        
    }
    return self;
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}
- (IBAction)shareAction:(UIButton *)sender {
}

@end
