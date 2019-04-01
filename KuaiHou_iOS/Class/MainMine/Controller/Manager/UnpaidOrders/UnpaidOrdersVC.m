//
//  UnpaidOrdersVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "UnpaidOrdersVC.h"
#import "UnpaidOrdersListCell.h"
#import "OpenStoreTipCell.h"
#import "MainSetBtnCell.h"

@interface UnpaidOrdersVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UnpaidOrdersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"未支付订单";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UnpaidOrdersListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([UnpaidOrdersListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTipCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTipCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 3;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = kMain_lineColor;
        return lineView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        if (indexPath.row == 0) {
            return 60;
        }else if (indexPath.row == 1){
            return 120;
        }else{
            return 70;
        }
    }
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UnpaidOrdersListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UnpaidOrdersListCell class]) forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            UnpaidOrdersListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UnpaidOrdersListCell class]) forIndexPath:indexPath];
            [cell.timeLab removeFromSuperview];
            cell.titleLab.text = @"全选";
            [cell setOrderMoney:@"1750"];
            return cell;
        }else if (indexPath.row == 1){
            OpenStoreTipCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTipCell class]) forIndexPath:indexPath];
            cell.leftLayout.constant = 40;
            cell.titleLab.text = @"提示：";
            cell.titleLabW.constant = 37;
            cell.tipLab.text = @"1.未支付达到5个订单以上或所欠金额达到1000元时 平台将会对您停止派单\n2.一个月内未支付所欠金额，平台有可能对您的网店进行暂时关停";
            return cell;
        }else{
            MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
            
            [cell.itemBtn setTitle:@"确认支付" forState:(UIControlStateNormal)];
            
            return cell;
        }
        
    }
    return nil;
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
