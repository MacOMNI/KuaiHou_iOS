//
//  MainMineVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainMineVC.h"
#import "MainMineHeadCell.h"
#import "MainMineListCell.h"
#import "MainSetVC.h"
#import "SWQRCode.h"
#import "ChangeInfoVC.h"
#import "VoucherVC.h"
#import "ActivityVC.h"
#import "OpenStoreVC.h"
#import "ManagerVC.h"
#import "MyQRCodeView.h"
#import "MyOrderVC.h"

@interface MainMineVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;


@end

@implementation MainMineVC

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
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainMineHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainMineHeadCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainMineListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainMineListCell class])];
    
    // @{@"image":@"mine_list4", @"title":@"认证"},@{@"image":@"mine_list3", @"title":@"道具"},
    self.listArray = @[@{@"image":@"mine_list1", @"title":@"任务"},@{@"image":@"mine_list2", @"title":@"活动"},@{@"image":@"mine_list5", @"title":@"开店"},@{@"image":@"mine_list6", @"title":@"经理人"}];
}

#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
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
    if (indexPath.section == 0) {
        return 300;
    }
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MainMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainMineHeadCell class]) forIndexPath:indexPath];
        [cell setItemBlock:^(int tag) {
            switch (tag) {
                case 1:{ // 扫一扫
                    SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
                    config.scannerType = SWScannerTypeBoth;
                    
                    SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
                    qrcodeVC.codeConfig = config;
                    [self.navigationController pushViewController:qrcodeVC animated:YES];
                }
                    break;
                case 2:{ // 设置
                    [self.navigationController pushViewController:[MainSetVC new] animated:YES];
                }
                    break;
                case 3:{ // 二维码
                    MyQRCodeView *view = [[MyQRCodeView alloc] init];
                    [view showView];
                }
                    break;
                case 4:{ // 修改资料
                    [self.navigationController pushViewController:[ChangeInfoVC new] animated:YES];
                }
                    break;
                case 100:{ // 钱包
                }
                    break;
                case 101:{ // 订单
                    [self.navigationController pushViewController:[MyOrderVC new] animated:YES];
                }
                    break;
                case 102:{ // 推广
                }
                    break;
                case 103:{ // 代金券
                    [self.navigationController pushViewController:[VoucherVC new] animated:YES];
                }
                    break;
                default:
                    break;
            }
        }];
        return cell;
    }
    NSDictionary *dict = self.listArray[indexPath.row];
    MainMineListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainMineListCell class]) forIndexPath:indexPath];
    cell.titleLab.text = dict[@"title"];
    cell.headImageView.image = [UIImage loadImageWithName:dict[@"image"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) { // 任务
            
        }else if (indexPath.row == 1){ // 活动
            [self.navigationController pushViewController:[ActivityVC new] animated:YES];
        }else if (indexPath.row == 2){ // 开店
            [self.navigationController pushViewController:[OpenStoreVC new] animated:YES];
        }else{ // 经理人
            [self.navigationController pushViewController:[ManagerVC new] animated:YES];
        }
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
