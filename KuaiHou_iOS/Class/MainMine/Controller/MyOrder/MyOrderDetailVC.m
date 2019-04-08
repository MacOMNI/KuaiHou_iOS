//
//  MyOrderDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/2.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyOrderDetailVC.h"
#import "MyOrderDetailItemCell.h"
#import "MyOrderDetailUserCell.h"
#import "MyOrderDetailListCell.h"
#import "MyOrderDetailPhotoCell.h"
#import "OpenStoreTextViewCell.h"
#import "ChecklistVC.h"
#import "TheOrderActivityVC.h"
#import "OrderComplaintVC.h"

#define kFloatingViewMinimumHeight 0
#define kFloatingViewMaximumHeight 300

@interface MyOrderDetailVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewTopConstraint;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MyOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

- (void)dealloc {
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

-(void)fixUI{
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;//因为会利用到tableView的contentInset，所以不想系统给我们改，最好把这个设置为UIRectEdgeNone,否则在viewDidAppear的时候tableView的contentInset会变
    self.tableView.contentInset = UIEdgeInsetsMake(kFloatingViewMaximumHeight, 0, 0, 0);
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    self.title = @"订单详情";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyOrderDetailItemCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyOrderDetailItemCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyOrderDetailUserCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyOrderDetailUserCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyOrderDetailListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyOrderDetailListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyOrderDetailPhotoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyOrderDetailPhotoCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    self.titleArray = @[@"包厢/台号",@"人数",@"到店时间",@"已使用代金券",@"提供代驾",@"订单日期",@"订单号"];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4 + self.titleArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == 0) {
        return 118;
    }else if(row == 1){
        return [MyOrderDetailUserCell getHeightBycontent:@"长沙市-开福区-三一大道18号-皇家永利 商务KTV"];
    }else if (row > 1 && row < self.titleArray.count + 2){
        return 44;
    }else if(row == self.titleArray.count + 2){
        return 250;
    }else if(row == self.titleArray.count + 3){
        return 160;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 90;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    return lineView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    if (row == 0) {
        MyOrderDetailItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyOrderDetailItemCell class]) forIndexPath:indexPath];
        [cell setItemBlock:^(NSInteger tag) {
            if (tag == 100) {
                [self.navigationController pushViewController:[OrderComplaintVC new] animated:YES];
            }else if (101 == tag){ // 核对账单
                [self.navigationController pushViewController:[ChecklistVC new] animated:YES];
            }else if (102 == tag){
                [self.navigationController pushViewController:[TheOrderActivityVC new] animated:YES];
            }
        }];
        return cell;
    }else if (row == 1){
        MyOrderDetailUserCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyOrderDetailUserCell class]) forIndexPath:indexPath];
        
        return cell;
    }else if (row > 1 && row < self.titleArray.count + 2){
        MyOrderDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyOrderDetailListCell class]) forIndexPath:indexPath];
        
        cell.titleLab.text = self.titleArray[row - 2];
        
        return cell;
    }else if (self.titleArray.count + 2 == row){
        
        
        MyOrderDetailPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyOrderDetailPhotoCell class]) forIndexPath:indexPath];
        
        return cell;
        
    }else if (self.titleArray.count + 3 == row){
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"需求";
        cell.wordNum.hidden = YES;
        cell.textView.xx_placeholder = @"未填写需求";
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
        }];
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"contentOffset"]) {
//        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        if (offset.y <= 0 && -offset.y >= kFloatingViewMinimumHeight) {
//            self.headViewHeightConstraint.constant = - offset.y;
//        } else {
//            self.headViewHeightConstraint.constant = kFloatingViewMinimumHeight;
//        }
//    }
//}


#pragma mark - kvo

//// 效果1：
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= kFloatingViewMaximumHeight) {
            self.headViewHeightConstraint.constant = - offset.y;
        } else if (offset.y < 0 && -offset.y < kFloatingViewMaximumHeight && -offset.y > kFloatingViewMinimumHeight) {
            self.headViewHeightConstraint.constant = kFloatingViewMaximumHeight;
            self.headerViewTopConstraint.constant = -offset.y - kFloatingViewMaximumHeight;
        } else {
            self.headerViewTopConstraint.constant = kFloatingViewMinimumHeight - kFloatingViewMaximumHeight;
        }
    }
}

//效果2：
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"contentOffset"]) {
//        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        if (offset.y <= 0 && -offset.y >= kFloatingViewMaximumHeight) {
//            self.headerViewTopConstraint.constant = -offset.y - kFloatingViewMaximumHeight;
//        } else if (offset.y < 0 && -offset.y < kFloatingViewMaximumHeight && -offset.y > kFloatingViewMinimumHeight) {
//            self.headerViewTopConstraint.constant = -offset.y - kFloatingViewMaximumHeight;
//        } else {
//            self.headerViewTopConstraint.constant = kFloatingViewMinimumHeight - kFloatingViewMaximumHeight;
//        }
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
