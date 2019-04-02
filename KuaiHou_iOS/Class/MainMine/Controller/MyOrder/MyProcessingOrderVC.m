//
//  MyProcessingOrderVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyProcessingOrderVC.h"
#import "MyProcessingOrderCell.h"
#import "CleanChatView.h"
#import "StartContentView.h"
#import "MyOrderDetailVC.h"

@interface MyProcessingOrderVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyProcessingOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = self.type == 0 ? @"进行中" : @"已完成";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyProcessingOrderCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyProcessingOrderCell class])];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 164;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyProcessingOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyProcessingOrderCell class]) forIndexPath:indexPath];
    
    cell.comeBtn.hidden = self.type == 1;
    cell.navigationBtn.hidden = self.type == 1;
    cell.phoneBtn.hidden = self.type == 1;
    cell.cancleBtn.hidden = self.type == 1;
    cell.deleteBtn.hidden = self.type == 0;
    cell.contentBtn.hidden = self.type == 0;
    
    [cell setItemBlock:^(NSInteger tag) {
        
        CleanChatView *clean = [[CleanChatView alloc] init];
        
        [clean setCommitBlock:^{
            if (tag == 101) {
                
            }else if (tag == 103){
                
            }else if (tag == 104){
                
            }else if (tag == 202){
                
            }
            
        }];
        
        if (tag == 101) {
            clean.titleLab.text = @"温馨提示";
            clean.tipLab.text = @"确认到店后，您使用的代金券将无法退回 结账时请与接待经理联系抵扣您使用的代金券";
            clean.tipLab.numberOfLines = 0;
            [clean showView];
        }else if (tag == 102){
            
        }else if (tag == 103){
            clean.titleLab.text = @"拨打接待经理电话";
            clean.tipLab.text = @"刘经理：15717328325";
            [clean showView];
        }else if (tag == 104){
            clean.titleLab.text = @"提示";
            clean.tipLab.text = @"是否取消订单";
            [clean showView];
        }else if (tag == 201){
            StartContentView *start = [[StartContentView alloc] init];
            [start showView];
        }else if (tag == 202){
            clean.titleLab.text = @"提示";
            clean.tipLab.text = @"是否删除此订单";
            [clean showView];
        }
    }];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[MyOrderDetailVC new] animated:YES];
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
