//
//  SafeCenterVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SafeCenterVC.h"
#import "SafeCenterVCTableViewCell.h"
#import "ChangePassWordVC.h"
#import "VerifiedVC.h"
#import "WithdrawWordVC.h"

@interface SafeCenterVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SafeCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"账号与安全";
    
    [self fixUI];
}

-(void)fixUI{
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.dataArray = [NSMutableArray arrayWithObjects:@[@"修改密码", @"手势密码"],@[@"提现密码", @"证件信息"],  nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SafeCenterVCTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([SafeCenterVCTableViewCell class])];
    
}

#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 0.001;
    }
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = self.dataArray[indexPath.section];
    SafeCenterVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SafeCenterVCTableViewCell class]) forIndexPath:indexPath];
    cell.titleLab.text = array[indexPath.row];
    cell.lineView.hidden = indexPath.section == 0 && indexPath.row == 1;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row == 0) { // 修改密码
                [self.navigationController pushViewController:[ChangePassWordVC new] animated:YES];
            }else{ // 手势密码
                
            }
        }
            break;
        case 1:{
            if (indexPath.row == 0) { // 提现密码
                [self.navigationController pushViewController:[WithdrawWordVC new] animated:YES];
            }else{ // 证件信息
                [self.navigationController pushViewController:[VerifiedVC new] animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
    
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
