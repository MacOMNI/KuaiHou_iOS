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

@end

@implementation WithdrawWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"提现密码";
    [MyTool fixCornerradius:self.commitBtn cornerRadius:20 Color:kMain_lineColor_C Width:0.5];
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
