//
//  ManagerVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagerVC.h"
#import "MainMineListCell.h"
#import "ManagerUserVC.h"
#import "ManagementStoreVC.h"
#import "StoreContentVC.h"
#import "ReleaseEventVC.h"
#import "ManagerOrdersVC.h"
#import "UnpaidOrdersVC.h"
#import "InviteStoreView.h"

@interface ManagerVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation ManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.title = @"经理人";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainMineListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainMineListCell class])];
    
    self.listArray = @[
                       @{@"image":@"manager_list0", @"title":@"我的用户"},
                       @{@"image":@"manager_list1", @"title":@"邀请驻店"},
                       @{@"image":@"manager_list2", @"title":@"管理网店"},
                       @{@"image":@"manager_list3", @"title":@"网店评论"},
                       @{@"image":@"manager_list4", @"title":@"发布活动"},
                       @{@"image":@"manager_list5", @"title":@"我的接单"},
                       @{@"image":@"manager_list6", @"title":@"未支付订单"}
                       ];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 58;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.listArray[indexPath.row];
    MainMineListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainMineListCell class]) forIndexPath:indexPath];
    cell.titleLab.text = dict[@"title"];
    cell.imageH.constant = 28;
    cell.imageW.constant = 28;
    cell.headImageView.image = [UIImage loadImageWithName:dict[@"image"]];
    cell.lineView.hidden = indexPath.row == self.listArray.count - 1;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            [self.navigationController pushViewController:[ManagerUserVC new] animated:YES];
        }
            break;
        case 1:{
            InviteStoreView *view = [[InviteStoreView alloc] init];
            [view showView];
        }
            break;

        case 2:{
            [self.navigationController pushViewController:[ManagementStoreVC new] animated:YES];
        }
            break;

        case 3:{
            [self.navigationController pushViewController:[StoreContentVC new] animated:YES];
        }
            break;

        case 4:{
            [self.navigationController pushViewController:[ReleaseEventVC new] animated:YES];
        }
            break;

        case 5:{
            [self.navigationController pushViewController:[ManagerOrdersVC new] animated:YES];
        }
            break;

        case 6:{
            [self.navigationController pushViewController:[UnpaidOrdersVC new] animated:YES];
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
