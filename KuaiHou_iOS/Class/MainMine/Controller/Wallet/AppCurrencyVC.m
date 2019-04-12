//
//  AppCurrencyVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppCurrencyVC.h"
#import "NearByDynamicsHeadCell.h"
#import "AppCurrencyItemCell.h"
#import "AppCurrencyTextFieldCell.h"
#import "AppCurrencyListCell.h"
#import "MainSetBtnCell.h"
#import "AppCurrencyDetailVC.h"


@interface AppCurrencyVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation AppCurrencyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"快币";
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"明细" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([NearByDynamicsHeadCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AppCurrencyItemCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AppCurrencyItemCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AppCurrencyTextFieldCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AppCurrencyTextFieldCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AppCurrencyListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AppCurrencyListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    
    self.listArray = @[@{@"title":@"微信支付", @"image":@"open_wechat"},@{@"title":@"支付宝支付", @"image":@"open_alipay"}];
}

-(void)rightAction{
    [self.navigationController pushViewController:[AppCurrencyDetailVC new] animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return self.listArray.count + 1;
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
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
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
        if (indexPath.row == 0) {
            return 79;
        }else if (indexPath.row == 1){
            return [AppCurrencyItemCell getHeightByCount:6];
        }else{
            return 60;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row < self.listArray.count) {
            return 55;
        }
        return 100;
        
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NearByDynamicsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NearByDynamicsHeadCell class]) forIndexPath:indexPath];
            
            cell.sexIconView.hidden = YES;
            cell.ageLab.hidden = YES;
            cell.distanceBtn.hidden = YES;
            
            return cell;

        }else if (indexPath.row == 1){
            AppCurrencyItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AppCurrencyItemCell class]) forIndexPath:indexPath];
            [cell reloadDataByArray:@[@"", @"", @"", @"", @"", @""]];
            
            return cell;

        }else{
            AppCurrencyTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AppCurrencyTextFieldCell class]) forIndexPath:indexPath];
            [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
                
            }];
            
            return cell;

        }
    }else if (indexPath.section == 1){
        if (indexPath.row < self.listArray.count) {
            NSDictionary *dict = self.listArray[indexPath.row];
            AppCurrencyListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AppCurrencyListCell class]) forIndexPath:indexPath];
            cell.titleLab.text = dict[@"title"];
            cell.headImageView.image = [UIImage loadImageWithName:dict[@"image"]];
            cell.iconBtn.selected = self.currentIndex == indexPath.row;
            return cell;
        }else{
            MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
            [cell.itemBtn setTitle:@"充值" forState:(UIControlStateNormal)];
            
            return cell;

        }
        

    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        self.currentIndex = indexPath.row;
        [self.tableView reloadData];
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
