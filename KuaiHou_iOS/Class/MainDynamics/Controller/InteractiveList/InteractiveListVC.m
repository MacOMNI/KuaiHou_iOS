//
//  InteractiveListVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "InteractiveListVC.h"
#import "InteractiveListCell.h"
#import "DIYSendToolbarView.h"
#import "DynamicsDetailVC.h"

@interface InteractiveListVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DIYSendToolbarView *sendView;

@end

@implementation InteractiveListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"互动";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InteractiveListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([InteractiveListCell class])];
    [self setTextViewToolbar];
}

- (void)setTextViewToolbar {
    self.sendView = [[DIYSendToolbarView alloc] init];
    self.sendView.textViewMaxLine = 3;
    self.sendView.fontSize = 15;
    __weak __typeof(self) weakSelf = self;
    [self.sendView inputToolbarSendText:^(NSString *text) {
        __typeof(&*weakSelf) strongSelf = weakSelf;
        // 清空输入框文字
        [strongSelf.sendView bounceToolbar];
        self.sendView.hidden = YES;
    }];
    [self.view addSubview:self.sendView];
    self.sendView.hidden = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
    return 135;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InteractiveListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InteractiveListCell class]) forIndexPath:indexPath];
    [cell setReplyBlock:^{
        self.sendView.hidden = NO;
        [self.sendView popToolbar];
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[DynamicsDetailVC new] animated:YES];
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
