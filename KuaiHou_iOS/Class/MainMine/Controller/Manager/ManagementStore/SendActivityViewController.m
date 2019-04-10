//
//  SendActivityViewController.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SendActivityViewController.h"
#import "OpenStoreListCell.h"
#import "OpenStoreTextViewCell.h"
#import "MainSetBtnCell.h"

@interface SendActivityViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SendActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"现有活动";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return 60;
    }
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor whiteColor];
        
        UILabel *lab = [MyTool setupLabel:@"提示：此活动编辑完成后将会显示在您的网店活动当中" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor_9 font:kFont(12)];
        lab.numberOfLines = 0;
        [lineView addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(lineView.mas_centerX);
            make.bottom.equalTo(lineView.mas_bottom);
        }];
        return lineView;
    }
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
        if (indexPath.row == 0 || indexPath.row == 2) {
            return 44;
        }else{
            return 160;
        }
    }else{
        return 86;
    }
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0 || indexPath.row == 2) {
            OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
            cell.titleLab.text = indexPath.row == 0 ? @"开始时间" : @"截止时间";
            cell.textField.placeholder = @"请选择";
            cell.textField.enabled = NO;
            cell.lineView.hidden = YES;
            return cell;

        }else{
            OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
            cell.titleLab.text = @"备注";
            cell.wordNum.hidden = YES;
//            cell.textView.xx_placeholder = @"请输入商品详细信息";
            [cell setChangeTextField:^(UITextView * _Nonnull textView) {
            }];
            return cell;
        }
    }else{
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:@"确定" forState:(UIControlStateNormal)];
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
