//
//  OrderComplaintVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OrderComplaintVC.h"
#import "OrderComplaintCell.h"
#import "OpenStoreTextViewCell.h"
#import "MainSetBtnCell.h"

@interface OrderComplaintVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation OrderComplaintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"投诉";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OrderComplaintCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OrderComplaintCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    
    self.dataArray = @[@"活动与实际消费不符",@"包厢环境与实际不符",@"服务态度较差"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count + 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataArray.count ) {
        return 44;
    }else if(indexPath.row == self.dataArray.count){
        return 160;
    }else if (indexPath.row == self.dataArray.count + 1){
        return 86;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.dataArray.count) {
        OrderComplaintCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OrderComplaintCell class]) forIndexPath:indexPath];
        return cell;
    }else if(indexPath.row == self.dataArray.count){
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = nil;
        cell.textView.xx_placeholder = @"其他投诉内容";
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
        }];
        return cell;
    }else if (indexPath.row == self.dataArray.count + 1){
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:@"提交" forState:(UIControlStateNormal)];
        return cell;
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
