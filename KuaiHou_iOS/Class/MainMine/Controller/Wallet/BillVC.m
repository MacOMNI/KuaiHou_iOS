//
//  BillVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BillVC.h"
#import "BillTypeCell.h"
#import "DIYSelectTimeView.h"

@interface BillVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BillVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"账单";
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BillTypeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([BillTypeCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *title = [MyTool setupLabel:[self getYearAndMonth].firstObject textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(24)];
    [lineView addSubview:title];
    
    [lineView setTapActionWithBlock:^{ // 弹出选择日期
        DIYSelectTimeView *selectTime = [[DIYSelectTimeView alloc] init];
        [selectTime setSelectAction:^(NSString * _Nonnull selectmonth, NSString * _Nonnull detailStr) {
            title.text = detailStr;
        }];
        [selectTime showView];
    }];
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage loadImageWithName:@"bill_icon"];
    [lineView addSubview:imageView];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_left).offset(15);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(title.mas_right).offset(15);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    return lineView;
}

-(NSArray *)getYearAndMonth{
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *currentDateComponents = [calendar components:calendarUnit fromDate:currentDate];
    NSInteger currentYear = [currentDateComponents year];
    NSInteger currentMonth = [currentDateComponents month];
    
    NSString *monthString = currentMonth < 10 ? [NSString stringWithFormat:@"0%ld", currentMonth] : [NSString stringWithFormat:@"%ld", currentMonth];
    
    return @[[NSString stringWithFormat:@"%ld年%@月", currentYear,monthString],[NSString stringWithFormat:@"%ld-%@", currentYear,monthString]];
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    
    UILabel *title = [MyTool setupLabel:@"共计：￥3189" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
    [lineView addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineView.mas_right).offset(-15);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *titleArray = @[@"合伙人收益：￥",@"代金券收益：￥",@"礼物总收益：￥"];
    BillTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BillTypeCell class]) forIndexPath:indexPath];
    cell.imageBgView.image = [UIImage loadImageWithName:[NSString stringWithFormat:@"bill_type%ld", indexPath.row]];
    cell.titleLab.text = titleArray[indexPath.row];
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
