//
//  PartnerChildVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "PartnerChildVC.h"
#import "PartnerChildCell.h"

@interface PartnerChildVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@end

@implementation PartnerChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PartnerChildCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([PartnerChildCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [MyTool setupLabel:@"总人数100" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.centerY.equalTo(view.mas_centerY);
    }];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PartnerChildCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PartnerChildCell class]) forIndexPath:indexPath];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - GKPageListViewDelegate
- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView * _Nonnull))callback {
    self.listScrollViewDidScroll = callback;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.listScrollViewDidScroll ? : self.listScrollViewDidScroll(scrollView);
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
