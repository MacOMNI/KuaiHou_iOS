//
//  FillTargetStoreInfoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FillTargetStoreInfoVC.h"
#import "OpenStoreListCell.h"
#import "OpenStoreTextViewCell.h"
#import "FillStoreSliderCell.h"
#import "MainSetBtnCell.h"
#import "FillStoreItemCell.h"
#import "FillStoreSexTypeCell.h"

@interface FillTargetStoreInfoVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FillTargetStoreInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"填写信息";
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FillStoreSliderCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FillStoreSliderCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FillStoreItemCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FillStoreItemCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FillStoreSexTypeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FillStoreSexTypeCell class])];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
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
    if (indexPath.row == 0) {
        return 60;
    }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
        return 44;
    }else if (indexPath.row == 5){
        return 80;
    }else if (indexPath.row == 6){
        return 175;
    }else if (indexPath.row == 7){
        return 86;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FillStoreItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FillStoreItemCell class]) forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4){
        OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
        cell.lineView.hidden = YES;
        if (indexPath.row == 1) {
            cell.titleLab.text = @"到店时间";
            cell.textField.placeholder = @"请选择";
        }else if (indexPath.row == 2){
            cell.titleLab.text = @"尊称";
            cell.textField.placeholder = @"请输入";
        }else if (indexPath.row == 4){
            cell.titleLab.text = @"联系电话";
            cell.textField.placeholder = @"请输入";
        }
        
        return cell;

    }else if (indexPath.row == 3){
        FillStoreSexTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FillStoreSexTypeCell class]) forIndexPath:indexPath];
        [cell setItemBlock:^(NSInteger tag) {
            
        }];
        
        return cell;

    }else if (indexPath.row == 5){
        FillStoreSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FillStoreSliderCell class]) forIndexPath:indexPath];
        
        return cell;

    }else if (indexPath.row == 6){
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"需求";
        cell.maxWordNum = 120;
        cell.textView.xx_placeholder = @"如有其它需求，请在此填写，我们尽量满足。";
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {

        }];
        return cell;
    }else if (indexPath.row == 7){
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:@"预定" forState:(UIControlStateNormal)];
        
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
