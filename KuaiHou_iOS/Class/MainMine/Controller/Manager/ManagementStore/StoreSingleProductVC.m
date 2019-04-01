//
//  StoreSingleProductVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StoreSingleProductVC.h"
#import "StoreSingleProductAddPhotoCell.h"
#import "OpenStoreListCell.h"
#import "StoreSingleProductUnitCell.h"
#import "OpenStoreTextViewCell.h"
#import "MainSetBtnCell.h"
#import "LiquorImageVC.h"

@interface StoreSingleProductVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StoreSingleProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"酒水配置（单点）";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StoreSingleProductAddPhotoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StoreSingleProductAddPhotoCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StoreSingleProductUnitCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StoreSingleProductUnitCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == 0) {
        return 170;
    }else if (row == 1 || row ==  3 ||row == 4){
        return 44;
    }else if (row == 2){
        return 85;
    }else if (row == 5){
        return 160;
    }else if (row == 6){
        return 86;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == 0) {
        StoreSingleProductAddPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StoreSingleProductAddPhotoCell class]) forIndexPath:indexPath];
        [cell.photoImageView setTapActionWithBlock:^{
            [self.navigationController pushViewController:[LiquorImageVC new] animated:YES];
        }];
        return cell;
    }else if (row == 1 || row ==  3 ||row == 4){
        OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
        if (row == 1) {
            cell.titleLab.text = @"品牌名称";
            cell.textField.placeholder = @"请输入品牌名称";
        }else if (row == 3){
            cell.titleLab.text = @"原价";
            cell.textField.placeholder = @"请输入此商品的原价";
        }else{
            cell.titleLab.text = @"折后价";
            cell.textField.placeholder = @"请输入此商品的折后价";
        }
        
        cell.textField.font = kFont(15);
        cell.lineView.hidden = YES;
        [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
            
        }];
        
        return cell;
    }else if (row == 2){
        StoreSingleProductUnitCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StoreSingleProductUnitCell class]) forIndexPath:indexPath];
        __weak StoreSingleProductUnitCell *weakCell = cell;
        [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
            if (textField.text.length > 0) {
                [weakCell setCurrentIndex:-1];
            }
        }];
        return cell;
    }else if (row == 5){
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"备注";
        cell.wordNum.hidden = YES;
        cell.textView.xx_placeholder = @"请输入商品详细信息";
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
        }];
        return cell;
    }else if (row == 6){
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
