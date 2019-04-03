//
//  WithdrawWordVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WithdrawWordVC.h"


@interface WithdrawWordVC ()
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;

@end

static NSString *getCode = @"WithdrawWordCode";

@implementation WithdrawWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"提现密码";
    [MyTool fixCornerradius:self.commitBtn cornerRadius:20 Color:kMain_lineColor_C Width:1];
    [MyTool fixCornerradius:self.codeBtn cornerRadius:2.5 Color:kMainColor Width:0.5];
    
    // 判断倒计任务是否已经结束
    if ([kWLButtonCountdownManager countdownTaskExistWithKey:getCode task:nil]) {
        [self shouldCountDown:getCode];
    };
}

-(void)shouldCountDown:(NSString *)type{
    [kWLButtonCountdownManager scheduledCountDownWithKey:type timeInterval:60 countingDown:^(NSTimeInterval leftTimeInterval) {
        self.codeBtn.enabled = NO;
//        self.codeBtn.backgroundColor = [UIColor colorWithHexString:@"#8f8f8f"];
        self.codeBtn.titleLabel.text =[NSString stringWithFormat:@"%@s重新发送", @(leftTimeInterval)];
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%@s重新发送", @(leftTimeInterval)] forState:(UIControlStateNormal)];
    } finished:^(NSTimeInterval finalTimeInterval) {
        self.codeBtn.enabled = YES;
//        self.codeBtn.backgroundColor = Main_Purple;
        [self.codeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    }];
}
- (IBAction)codeAction:(UIButton *)sender {
    [self shouldCountDown:getCode];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
