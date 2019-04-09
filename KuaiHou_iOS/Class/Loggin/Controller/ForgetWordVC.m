//
//  ForgetWordVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ForgetWordVC.h"

@interface ForgetWordVC ()
@property (weak, nonatomic) IBOutlet UITextField *accTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nextWordTextField;

@end

@implementation ForgetWordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.accTextField.placeholderDIYColor = kMain_TextColor_9;
    self.codeTextField.placeholderDIYColor = kMain_TextColor_9;
    self.wordTextField.placeholderDIYColor = kMain_TextColor_9;
    self.nextWordTextField.placeholderDIYColor = kMain_TextColor_9;
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
