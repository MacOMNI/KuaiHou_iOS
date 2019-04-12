//
//  AppCurrencyDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppCurrencyDetailVC.h"
#import "AppCurrencyDetailCell.h"

@interface AppCurrencyDetailVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AppCurrencyDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"快币明细";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AppCurrencyDetailCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AppCurrencyDetailCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    UILabel *title1 = [MyTool setupLabel:@"描述" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor_9 font:kFont(12)];
    [lineView addSubview:title1];
    
    UILabel *title2 = [MyTool setupLabel:@"时间" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor_9 font:kFont(12)];
    [lineView addSubview:title2];
    
    UILabel *title3 = [MyTool setupLabel:@"快币" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor_9 font:kFont(12)];
    [lineView addSubview:title3];
    
    [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_left).offset(20);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(lineView);
    }];
    
    [title3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView.mas_right).offset(-20);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    return lineView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppCurrencyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AppCurrencyDetailCell class]) forIndexPath:indexPath];
    
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
