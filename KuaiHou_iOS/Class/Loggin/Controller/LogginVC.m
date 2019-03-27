//
//  LogginVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "LogginVC.h"
#import "LogginCell.h"
#import "RegisVC.h"

@interface LogginVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *regisImageView;
@property (weak, nonatomic) IBOutlet UILabel *regisLab;
@property (weak, nonatomic) IBOutlet UIImageView *weChatImageView;
@property (weak, nonatomic) IBOutlet UILabel *weChatLab;

@end

@implementation LogginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)fixUI{
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LogginCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([LogginCell class])];
    
    [self.regisImageView setTapActionWithBlock:^{
        [self.navigationController pushViewController:[RegisVC new] animated:YES];
    }];
    [self.regisLab setTapActionWithBlock:^{
        [self.navigationController pushViewController:[RegisVC new] animated:YES];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 370;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LogginCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LogginCell class]) forIndexPath:indexPath];
    [cell setItemBlock:^(NSInteger tag) {
        if (tag == 101) { // 忘记密码
            
        }else{ // 登陆
            
        }
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
