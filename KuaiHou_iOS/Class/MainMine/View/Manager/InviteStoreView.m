//
//  InviteStoreView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "InviteStoreView.h"

@interface InviteStoreView ()

@property (nonatomic, strong) UIView *maskView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation InviteStoreView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"InviteStoreView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 275;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        [self.textField setValue:kMain_TextColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    
    
    return self;
}


- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}
- (IBAction)commitAction:(UIButton *)sender {
    [self hiddenView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
