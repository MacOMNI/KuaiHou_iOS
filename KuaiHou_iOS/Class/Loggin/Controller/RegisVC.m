//
//  RegisVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "RegisVC.h"
#import "GetCodeVC.h"

@interface RegisVC ()
@property (weak, nonatomic) IBOutlet UIImageView *accLogginImageView;
@property (weak, nonatomic) IBOutlet UILabel *accLab;
@property (weak, nonatomic) IBOutlet UIImageView *weChatImageView;
@property (weak, nonatomic) IBOutlet UILabel *weChatLab;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RegisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    [self.accLogginImageView setTapActionWithBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.accLab setTapActionWithBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.textField.placeholderDIYColor = kMain_TextColor_9;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (IBAction)getCodeAction:(UIButton *)sender {
    [self.navigationController pushViewController:[GetCodeVC new] animated:YES];
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
