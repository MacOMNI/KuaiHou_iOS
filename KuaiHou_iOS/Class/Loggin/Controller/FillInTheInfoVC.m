//
//  FillInTheInfoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FillInTheInfoVC.h"
#import "SelPhotoVC.h"

@interface FillInTheInfoVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birTextField;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nextTextField;

@end

@implementation FillInTheInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameTextField.placeholderDIYColor = kMain_TextColor_9;
    
    self.birTextField.placeholderDIYColor = kMain_TextColor_9;
    
    self.wordTextField.placeholderDIYColor = kMain_TextColor_9;
    
    self.nextTextField.placeholderDIYColor = kMain_TextColor_9;
}
- (IBAction)commit:(UIButton *)sender {
    [self.navigationController pushViewController:[SelPhotoVC new] animated:YES];
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
