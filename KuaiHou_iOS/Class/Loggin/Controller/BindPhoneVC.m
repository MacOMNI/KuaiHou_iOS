//
//  BindPhoneVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BindPhoneVC.h"
#import "SetPassWordVC.h"

@interface BindPhoneVC ()
@property (weak, nonatomic) IBOutlet UITextField *accTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation BindPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.accTextField.placeholderDIYColor = kMain_TextColor_9;
    self.codeTextField.placeholderDIYColor = kMain_TextColor_9;
}
- (IBAction)commitAction:(UIButton *)sender {
    [self.navigationController pushViewController:[SetPassWordVC new] animated:YES];
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
