//
//  BillObjectionVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BillObjectionVC.h"

@interface BillObjectionVC ()
@property (weak, nonatomic) IBOutlet XXTextView *textView;

@end

@implementation BillObjectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"账单异议";
    self.textView.xx_placeholder = @"您对本次消费和服务存在不满意或对此消费账单有异议的地方， 请告诉我们，我们将在1个工作日内进行处理";
    self.textView.xx_placeholderFont = kFont(12);
    self.textView.xx_placeholderColor = kMain_TextColor_9;
    
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
