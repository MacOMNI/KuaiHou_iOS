//
//  StorePackageVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StorePackageVC.h"
#import "StoreSingleProductAddPhotoCell.h"
#import "OpenStoreListCell.h"
#import "OpenStoreTextViewCell.h"
#import "MainSetBtnCell.h"

@interface StorePackageVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StorePackageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"酒水配置（套餐）";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StoreSingleProductAddPhotoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StoreSingleProductAddPhotoCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {
        if (row == 0) {
            return 170;
        }else if (row == 1 || row ==  3 ||row == 4){
            return 44;
        }else if (row == 2){
            return 160;
        }
    }else{
        return 170;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    
    return 0.001;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    
    return lineView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {
        if (row == 0) {
            StoreSingleProductAddPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StoreSingleProductAddPhotoCell class]) forIndexPath:indexPath];
            cell.titleLab.text = @"套餐图片";
            return cell;
        }else if (row == 1 || row ==  3 ||row == 4){
            OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
            if (row == 1) {
                cell.titleLab.text = @"套餐名称";
                cell.textField.placeholder = @"请输入套餐名称";
            }else if (row == 3){
                cell.titleLab.text = @"原价";
                cell.textField.placeholder = @"请输入此套餐的原价";
            }else{
                cell.titleLab.text = @"折后价";
                cell.textField.placeholder = @"请输入此套餐的折后价";
            }
            
            cell.textField.font = kFont(15);
            cell.lineView.hidden = YES;
            [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
                
            }];
            
            return cell;
        }else if (row == 2){
            OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
            cell.titleLab.text = @"套餐内容";
            cell.wordNum.hidden = YES;
            cell.textView.xx_placeholder = @"请输入套餐详细内容";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
