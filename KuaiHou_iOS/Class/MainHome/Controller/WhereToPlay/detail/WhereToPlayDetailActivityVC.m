//
//  WhereToPlayDetailActivityVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailActivityVC.h"
#import "ContentCell.h"

@interface WhereToPlayDetailActivityVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@end

@implementation WhereToPlayDetailActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ContentCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ContentCell class])];
    
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
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
    iconView.image = [UIImage loadImageWithName:@"where_title3"];
    [view addSubview:iconView];
    
    UILabel *titlLab = [MyTool setupLabel:@"详情" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
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
    if (indexPath.row == 0) {
        return [ContentCell getHeightByContent:@"买洋酒、啤酒套餐优惠放假加价实施（P大房加200元、豪华房 加280元、贵宾、总统厢加300元、可免费欢唱3小时）"];
    }else if (indexPath.row == 1){
        return 30;
    }
    
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ContentCell class]) forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell setContent:@"买洋酒、啤酒套餐优惠放假加价实施（P大房加200元、豪华房 加280元、贵宾、总统厢加300元、可免费欢唱3小时）"];

    }else if (indexPath.row == 1){
        [cell setContent:@"活动期限：2018年10月11日-2018年10月15日"];
        cell.contentLab.textColor = kMain_TextColor_9;
    }
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
