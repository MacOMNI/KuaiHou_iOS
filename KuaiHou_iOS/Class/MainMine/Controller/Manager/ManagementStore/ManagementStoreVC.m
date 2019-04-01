//
//  ManagementStoreVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagementStoreVC.h"
#import "OpenStoreListCell.h"
#import "ManagementStoreActivityCell.h"
#import "ManagementStoreAddCell.h"
#import "ManagementStoreBoxTypeCell.h"
#import "ManagementStoreConfigCell.h"
#import "ManagementStoreConfigTitleCell.h"
#import "ManagementStoreTextViewCell.h"
#import "MainSetListCell.h"
#import "ManagementStoreChangeTimeCell.h"
#import "MainSetBtnCell.h"

#import "StoreSingleProductVC.h"
#import "StorePackageVC.h"
#import "StoreBoxTypeVC.h"

@interface ManagementStoreVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *activityArray;// 现有活动
@property (nonatomic, strong) NSMutableArray *boxTypeArray; // 台位类型
@property (nonatomic, strong) NSMutableArray *config_one; // 酒水配置_单点
@property (nonatomic, strong) NSMutableArray *config_two; // 酒水配置_套餐
@property (nonatomic, strong) NSString *playDetailStr; // 特色玩法
@property (nonatomic, strong) NSString *timeStr; // 营业时间
@property (nonatomic, assign) NSInteger isOpen; // 是否营业


@property (nonatomic, assign) BOOL boxTypeIsOpen; // 是否展开台位类型
@property (nonatomic, assign) BOOL configIfOpen;  // 是否展开酒水配置



@end

@implementation ManagementStoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"管理网店";
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
//    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"预览" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreActivityCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreActivityCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreAddCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreAddCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreBoxTypeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreBoxTypeCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreConfigTitleCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreConfigTitleCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreConfigCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreConfigCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ManagementStoreChangeTimeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ManagementStoreChangeTimeCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    
    [self getData];
}

-(void)getData{
    // 活动的测试数据
    self.activityArray = [NSMutableArray new];
    self.boxTypeArray = [NSMutableArray new];
    self.config_one = [NSMutableArray new];
    self.config_two = [NSMutableArray new];
    
    self.boxTypeIsOpen = YES; // 默认展开台位类型
    self.configIfOpen = YES; // 默认展开酒水配置
    
    NSDictionary *dict = @{@"time":@"2018年10月11日-2018年10月15日", @"content":@"买洋酒、啤酒套餐优惠放假加价实施（P大房加200元、豪华房加 280元、贵宾、总统厢加300元、可免费欢唱3小时）"};
    for (int i = 0; i < 3; i++) {
        [self.activityArray addObject:dict];
    }
    
    
    NSDictionary *boxDict = @{@"type":@"中包", @"num":@"4~7人", @"boxMoney":@"￥800", @"minMoney":@"￥1980"};
    for (int i = 0; i < 3; i++) {
        [self.boxTypeArray addObject:boxDict];
    }
    
    NSDictionary *configDict = @{@"title":@"百威", @"type":@"（啤酒）", @"detail":@"10月13日至10月15日期间此款啤酒5折10月13日至10月15日期间此款啤酒5折。", @"discount":@"580/打", @"price":@"￥880"};
    
    for (int i = 0; i < 3; i++) {
        [self.config_one addObject:configDict];
        [self.config_two addObject:configDict];
    }
    
}


// row
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){ // 现有活动
        return self.activityArray.count + 1; // +1 == 添加Cell
    }else if (section == 2){ // 台位类型
        return self.boxTypeIsOpen ? self.boxTypeArray.count + 2 : 0;
    }else if (section == 3){
        return self.configIfOpen ? self.config_one.count + self.config_two.count + 4 : 0;
    }else if (section == 4){
        return 1;
    }else if (section == 5){
        return 2;
    }else if (section == 6){
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 44;
    }else if (indexPath.section == 1){
        if (indexPath.row < self.activityArray.count) { // 活动的cell
            NSDictionary *dict = self.activityArray[indexPath.row];
            CGFloat height = [ManagementStoreActivityCell getHeightByContent:dict[@"content"]];
            return indexPath.row == 0 ? height - 15 : height;
        }else{
            return 39;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == self.boxTypeArray.count + 1) {
            return 39;
        }else{
            return 27;
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) { // 标题 单点/套餐
            return 27;
        }else if (indexPath.row == self.config_one.count + 2){
            return 42;
        }else if (indexPath.row == self.config_one.count + 1 || indexPath.row == self.config_one.count + self.config_two.count + 3){
            return 54;
        }else{
            return 95;
        }
    }else if (indexPath.section == 4) {
        return 188;
    }else if (indexPath.section == 5){
        return 44;
    }else if (indexPath.section == 6){
        return 86;
    }
    return 0;
}

// header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001;
    }else if (section == 1 || section == 2 || section == 3){
        return 45;
    }
    return 0.0001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.userInteractionEnabled = YES;
    view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLab = [MyTool setupLabel:@"现有活动" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
    [view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view.mas_top).offset(15);
        make.left.equalTo(view.mas_left).offset(15);
        make.centerY.equalTo(view.mas_centerY);
        make.height.mas_equalTo(@15);
    }];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage loadImageWithName:@"base_right"] forState:(UIControlStateNormal)];
    [button setImage:[UIImage loadImageWithName:@"base_down"] forState:(UIControlStateSelected)];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_right).offset(-15);
        make.centerY.equalTo(view.mas_centerY);
    }];
    button.hidden = section == 1;
    
    [view setTapActionWithBlock:^{
        if (section == 2) {
            self.boxTypeIsOpen = !self.boxTypeIsOpen;
        }else if (section == 3){
            self.configIfOpen = !self.configIfOpen;
        }
        [self.tableView reloadData];
    }];
    
    
    if (section == 1) {
        
    }else if (section == 2){
        titleLab.text = @"台位类型";
        button.selected = self.boxTypeIsOpen;
    }else if (section == 3){
        titleLab.text = @"酒水配置";
        button.selected = self.configIfOpen;
        
    }
    return section == 1 || section == 2 || section == 3  ? view : nil;
    
//    return nil;
}

// footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001;
    }else if(section == 1 || section == 2 || section == 3 || section == 4 || section == 5){
        return 10;
    }
    
    return 0.001;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;

    return section == 1 || section == 2 || section == 3 || section == 4 || section == 5 ? lineView : nil;
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"酒水折扣";
        cell.textField.placeholder = @"请输入您可以为顾客所提供的最优惠折扣";
        [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
            
        }];
        return cell;
    }else if (section == 1){ // 活动
        if (indexPath.row < self.activityArray.count) {
            NSDictionary *dict = self.activityArray[indexPath.row];
            ManagementStoreActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreActivityCell class]) forIndexPath:indexPath];
            cell.timeLab.text = dict[@"time"];
            cell.detailLab.text = dict[@"content"];
            
            cell.lineView.hidden = self.activityArray.count - 1 == indexPath.row;
            return cell;
        }else{ // 添加按钮
            ManagementStoreAddCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreAddCell class]) forIndexPath:indexPath];
            [cell setAddBlock:^{
                NSDictionary *dict = @{@"time":@"2018年10月11日-2018年10月15日", @"content":@"买洋酒、啤酒套餐优惠放假加价实施（P大房加200元、豪华房加 280元、贵宾、总统厢加300元、可免费欢唱3小时）"};
                [self.activityArray addObject:dict];
                [self.tableView reloadData];
            }];
            return cell;
        }
    }else if (section == 2){
        if (row == self.boxTypeArray.count +1) { //  添加
            ManagementStoreAddCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreAddCell class]) forIndexPath:indexPath];
            [cell setAddBlock:^{
                StoreBoxTypeVC *box = [StoreBoxTypeVC new];
                [self.navigationController pushViewController:box animated:YES];
//                NSDictionary *boxDict = @{@"type":@"中包", @"num":@"4~7人", @"boxMoney":@"￥800", @"minMoney":@"￥1980"};
//                [self.boxTypeArray addObject:boxDict];
//                [self.tableView reloadData];
            }];
            return cell;
        }else{
            ManagementStoreBoxTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreBoxTypeCell class]) forIndexPath:indexPath];
            if (row > 0) {
                NSInteger index = row - 1;
                NSDictionary *dict = self.boxTypeArray[index];
                cell.typeLab.text = dict[@"type"];
                cell.numLab.text = dict[@"num"];
                cell.boxMoneyLab.text = dict[@"boxMoney"];
                cell.minMoneyLab.text = dict[@"minMoney"];
                
            }else{
                cell.typeLab.text = @"包厢/卡台类型";
                cell.numLab.text = @"可容纳人数";
                cell.boxMoneyLab.text = @"包厢费";
                cell.minMoneyLab.text = @"最低消费";
            }
            
            return cell;
        }
    }else if (section == 3){
        if (indexPath.row == 0 || indexPath.row == self.config_one.count + 2) {
             ManagementStoreConfigTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreConfigTitleCell class]) forIndexPath:indexPath];
            cell.titleLab.text = indexPath.row == 0 ? @"单点" : @"套餐";
            cell.toplinView.hidden = indexPath.row == 0;
            return cell;
        }else if (row == self.config_one.count + 1 || row == self.config_one.count + self.config_two.count + 3){
            ManagementStoreAddCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreAddCell class]) forIndexPath:indexPath];
            [cell setAddBlock:^{
//                NSDictionary *configDict = @{@"title":@"百威", @"type":@"（啤酒）", @"detail":@"10月13日至10月15日期间此款啤酒5折10月13日至10月15日期间此款啤酒5折。", @"discount":@"580/打", @"price":@"￥880"};
                if (row == self.config_one.count + 1) {
                    StoreSingleProductVC *singleVC = [StoreSingleProductVC new];
                    [self.navigationController pushViewController:singleVC animated:YES];
//                    [self.config_one addObject:configDict];
                }else{
                    StorePackageVC *package = [StorePackageVC new];
                    [self.navigationController pushViewController:package animated:YES];
//                    [self.config_two addObject:configDict];
                }
                
                [self.tableView reloadData];
            }];
            return cell;
        }else{
            ManagementStoreConfigCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreConfigCell class]) forIndexPath:indexPath];
            if (row < self.config_one.count + 1) {
                NSDictionary *dict = self.config_one[row - 1];
                [cell configByImageName:@"" title:dict[@"title"] detail:dict[@"detail"] discount:dict[@"discount"] price:dict[@"price"]];
            }
            if (row > self.config_one.count + 2 && row < self.config_one.count + self.config_two.count + 3) {
                NSDictionary *dict = self.config_two[row - 3 - self.config_one.count];
                [cell configByImageName:@"" title:dict[@"title"] detail:dict[@"detail"] discount:dict[@"discount"] price:dict[@"price"]];
            }
            return cell;
        }
    }else if (section == 4){
        ManagementStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreTextViewCell class]) forIndexPath:indexPath];
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
            
        }];
        return cell;
    }else if (section == 5){
        if (row == 1) {
            MainSetListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetListCell class]) forIndexPath:indexPath];
            cell.titleLab.text = @"是否营业";
            return cell;
        }else{
            ManagementStoreChangeTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ManagementStoreChangeTimeCell class]) forIndexPath:indexPath];
            return cell;
        }
        
    }else if (section == 6){
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:@"保存" forState:(UIControlStateNormal)];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




-(void)showAction{
    
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
