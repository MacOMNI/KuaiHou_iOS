//
//  ChangePassWordVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/22.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ChangePassWordVC.h"

@interface ChangePassWordVC ()
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation ChangePassWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"修改密码";
    [MyTool fixCornerradius:self.commitBtn cornerRadius:20 Color:kMain_lineColor_C Width:0.5];
}
- (IBAction)commitAction:(id)sender {
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
