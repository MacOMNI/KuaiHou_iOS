//
//  WhereConsumeVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereConsumeVC.h"
#import "WhereConsumeCell.h"

@interface WhereConsumeVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@end

@implementation WhereConsumeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WhereConsumeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([WhereConsumeCell class])];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage loadImageWithName:[NSString stringWithFormat:@"where_consume%ld", section]];
    [view addSubview:iconView];
    
    UILabel *titlLab = [MyTool setupLabel:@[@"台位类型", @"单点", @"套餐"][section] textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
    [view addSubview:titlLab];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(view.mas_centerY);
    }];
    
    [titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(10);
        make.centerY.equalTo(view.mas_centerY);
    }];
    
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 130;
    }
    return 210;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WhereConsumeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WhereConsumeCell class]) forIndexPath:indexPath];
    
    cell.type = indexPath.section == 0 ? 0 : 1;
    
    return cell;
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
