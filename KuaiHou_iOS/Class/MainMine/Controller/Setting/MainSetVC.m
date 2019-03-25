//
//  MainSetVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainSetVC.h"
#import "MainSetListCell.h"
#import "MainSetBtnCell.h"
#import "SafeCenterVC.h"
#import "AboutMeVC.h"
#import "HelpVC.h"


@interface MainSetVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MainSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    [self fixUI];
}

-(void)fixUI{
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.dataArray = [NSMutableArray arrayWithObjects:@[@"安全中心", @"使用帮助"],@[@"屏蔽设置", @"屏蔽的号码", @"屏蔽的动态"], @[@"开启锁屏", @"静音", @"震动"], @[@"清除聊天记录", @"关于我们"], @[@"退出账号"],  nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
}
#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return 0.001;
    }
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4) {
        return 86;
    }
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = self.dataArray[indexPath.section];
    
    
    if (indexPath.section == 4) {
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:array[indexPath.row] forState:(UIControlStateNormal)];
        return cell;
    }else{
        MainSetListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetListCell class]) forIndexPath:indexPath];
        cell.switchBtn.hidden = indexPath.section != 2;
        cell.titleLab.text = array[indexPath.row];
        return cell;
    }
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row == 0) { // 安全中心
                [self.navigationController pushViewController:[SafeCenterVC new] animated:YES];
            }else{ // 使用帮助
                [self.navigationController pushViewController:[HelpVC new] animated:YES];
            }
        }
            
            break;
        case 1:{
            if (indexPath.row == 0) { // 屏蔽设置
                
            }else if(indexPath.row == 1){ // 屏蔽的号码
                
            }else{ // 屏蔽的动态
                
            }
        }
            
            break;
        case 2:{
            
        }
            
            break;
        case 3:{
            if (indexPath.row == 0) { // 清除聊天记录
                
            }else{ // 关于我们 
                [self.navigationController pushViewController:[AboutMeVC new] animated:YES];
            }
        }
            
            break;
            
        default:
            break;
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
