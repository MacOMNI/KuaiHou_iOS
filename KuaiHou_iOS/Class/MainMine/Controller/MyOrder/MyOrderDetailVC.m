//
//  MyOrderDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/2.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyOrderDetailVC.h"

#define kFloatingViewMinimumHeight 0
#define kFloatingViewMaximumHeight 300

@interface MyOrderDetailVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewTopConstraint;

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
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;//因为会利用到tableView的contentInset，所以不想系统给我们改，最好把这个设置为UIRectEdgeNone,否则在viewDidAppear的时候tableView的contentInset会变
    self.tableView.contentInset = UIEdgeInsetsMake(kFloatingViewMaximumHeight, 0, 0, 0);
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    self.title = @"订单详情";
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index : (%ld, %ld)", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
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
