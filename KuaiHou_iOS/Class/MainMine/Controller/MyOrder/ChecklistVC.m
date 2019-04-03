//
//  ChecklistVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ChecklistVC.h"
#import "BillObjectionVC.h"

@interface ChecklistVC ()

@end

@implementation ChecklistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"核对账单";
    
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"有异议" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void)rightAction{
    [self.navigationController pushViewController:[BillObjectionVC new] animated:YES];
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
