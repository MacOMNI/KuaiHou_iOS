//
//  OpenPartnerVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenPartnerVC.h"
#import "OpenPartnerCell.h"


@interface OpenPartnerVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OpenPartnerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    if (self.type == 1) {
        self.title = @"续费合伙人";
    }else{
        self.title = @"开通合伙人";
    }
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenPartnerCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenPartnerCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
    return 470;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OpenPartnerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenPartnerCell class]) forIndexPath:indexPath];
    cell.titleLab.text = self.type == 1 ? @"续费合伙人":@"开通合伙人";
    [cell.commitBtn setTitle:self.type == 1 ? @"确定":@"开通" forState:(UIControlStateNormal)];
    
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
