//
//  StoreBoxTypeVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StoreBoxTypeVC.h"
#import "OpenStoreListCell.h"
#import "OpenStoreTextViewCell.h"
#import "MainSetBtnCell.h"


@interface StoreBoxTypeVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation StoreBoxTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"台位类型";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    
    self.titleArray = @[@"包厢/卡台类型",@"可容纳人数",@"包厢费",@"最低消费",@"低消配置"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row <= 3){
        return 50;
    }else if (row == 4){
        return 175;
    }else{
        return 170;
    }
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row <= 3) {
        OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
        cell.titleLab.text = self.titleArray[row];
        cell.textField.placeholder = @"请输入";
        cell.textField.font = kFont(15);
        cell.lineView.hidden = YES;
        [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
            
        }];
        return cell;
    }else if (row == 4){
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = self.titleArray[row];
        cell.textView.xx_placeholder = @"请输入低消所包含的内容";
        cell.maxWordNum = 60;
        cell.wordNum.font = kFont(15);
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
        }];
        return cell;
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
