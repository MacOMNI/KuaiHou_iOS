//
//  WhereToPlayDetailInfoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailInfoVC.h"
#import "WhereToPlayDetailInfoHeadView.h"
#import "WhereToPlayDetailInfoUserListCell.h"
#import "ContentCell.h"
#import "RatingStarCell.h"

@interface WhereToPlayDetailInfoVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation WhereToPlayDetailInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.dataArray = @[@"最近访问的人",@"网店简介",@"评论"];
    [self setHeadView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WhereToPlayDetailInfoUserListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([WhereToPlayDetailInfoUserListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ContentCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ContentCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RatingStarCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([RatingStarCell class])];
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

-(void)setHeadView{
    WhereToPlayDetailInfoHeadView *headView = [[WhereToPlayDetailInfoHeadView alloc] init];
    headView.frame = CGRectMake(0, 0, kScreenSizeWidth, 200);
    self.tableView.tableHeaderView = headView;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 65;
    }
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //where_title%ld
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage loadImageWithName:[NSString stringWithFormat:@"where_title%ld", section]];
    [view addSubview:iconView];
    
    UILabel *titlLab = [MyTool setupLabel:self.dataArray[section] textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
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
    if (section == 3) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor whiteColor];
        return lineView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 32;
    }else if (indexPath.section == 1){
        return [ContentCell getHeightByContent:@"随着时尚的跳舞音乐，发现感受生命的惬意和热情，这里已成为许多都会男女的留恋之地，在圣都可以找到最时尚的人群、最前卫的音乐、最国际化的主题PARTY，从视觉上、听觉上给感官带来最全面的享受，这才是真正属于我们的跳舞世界。你可以随心所欲，想怎么HIGH就怎么HIGH。"];
    }else if (indexPath.section == 2){
        return 30;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WhereToPlayDetailInfoUserListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WhereToPlayDetailInfoUserListCell class]) forIndexPath:indexPath];
        [cell reloadViewByArray:@[@"",@"",@"",@"",@""]];
        
        return cell;
    }else if (indexPath.section == 1){
        ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ContentCell class]) forIndexPath:indexPath];
        cell.content = @"随着时尚的跳舞音乐，发现感受生命的惬意和热情，这里已成为许多都会男女的留恋之地，在圣都可以找到最时尚的人群、最前卫的音乐、最国际化的主题PARTY，从视觉上、听觉上给感官带来最全面的享受，这才是真正属于我们的跳舞世界。你可以随心所欲，想怎么HIGH就怎么HIGH。";
        
        return cell;

    }else if (indexPath.section == 2){
        NSArray *titleArray = @[@"服务态度",@"场所环境",@"满意程度"];
        RatingStarCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RatingStarCell class]) forIndexPath:indexPath];
        cell.titleLab.text = titleArray[indexPath.row];
        cell.startView.score = indexPath.row;
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
