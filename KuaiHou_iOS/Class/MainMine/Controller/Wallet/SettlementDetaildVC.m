//
//  SettlementDetaildVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SettlementDetaildVC.h"
#import "SettlementDetaildCell.h"

@interface SettlementDetaildVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettlementDetaildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"结算明细";
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SettlementDetaildCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([SettlementDetaildCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
    return 270;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettlementDetaildCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettlementDetaildCell class]) forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.typeLineView.backgroundColor = kMain_TextColor_9;
        cell.topLayout.active = NO;
        cell.endTime.hidden = YES;
        cell.endTypeBtn.selected = NO;
    }else{
        cell.typeLineView.backgroundColor = [UIColor colorWithHexString:@"#4CB3FF"];
        cell.topLayout.active = YES;
        cell.endTime.hidden = NO;
        cell.endTypeBtn.selected = YES;
    }
    
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
