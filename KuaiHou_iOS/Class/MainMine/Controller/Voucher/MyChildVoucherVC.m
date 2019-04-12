//
//  MyChildVoucherVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/4.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyChildVoucherVC.h"
#import "VoucherCollectionCell.h"
#import "VoucherCell.h"

@interface MyChildVoucherVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyChildVoucherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"使用代金券";
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([VoucherCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([VoucherCell class])];
    
}
-(void)setType:(NSInteger)type{
    _type = type;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
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
    return 110;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VoucherCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VoucherCell class]) forIndexPath:indexPath];
    
    cell.commitBtn.hidden = self.type != 0;
    cell.typeImageView.hidden = self.type == 0;
    cell.typeImageView.image = self.type == 0 ? [UIImage new] : [UIImage loadImageWithName:[NSString stringWithFormat:@"voucher_type%ld", self.type]];
    
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
