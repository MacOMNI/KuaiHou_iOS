//
//  InfoDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "InfoDetailVC.h"
#import "InfoDetailIconCell.h"
#import "InfoDetaildNorCell.h"

@interface InfoDetailVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation InfoDetailVC

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
    
    self.dataArray = [NSMutableArray arrayWithObjects:
                      @[@"昵称",@"生日",@"身高",@"体重"] ,
                      @[@"+ 我的个性标签"],
                      @[@"+ 我喜欢的运动",@"+ 我喜欢的音乐",@"+ 我喜欢的食物",@"+ 我喜欢的电影",@"+ 我喜欢的书籍",@"+ 我的旅行足迹"],
                      @[@"+ 添加行业信息",@"+ 添加工作领域信息",@"+ 添加工作领域信息",@"+ 添加工作领域信息",@"+ 添加你常去的地方"],
                      nil
                      ];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InfoDetailIconCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([InfoDetailIconCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([InfoDetaildNorCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([InfoDetaildNorCell class])];
    
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    return array.count;
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
    
    NSArray *titleArray = @[@"个人信息", @"我的标签", @"我的兴趣", @"其他信息"];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage loadImageWithName:[NSString stringWithFormat:@"change_section_%ld", section]];
    [view addSubview:iconView];
    
    UILabel *titlLab = [MyTool setupLabel:titleArray[section] textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
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
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.dataArray[indexPath.section];
    if (indexPath.section == 0) {
        InfoDetaildNorCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InfoDetaildNorCell class]) forIndexPath:indexPath];
        cell.titleLab.text = array[indexPath.row];
        return cell;
    }
    InfoDetailIconCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InfoDetailIconCell class]) forIndexPath:indexPath];
    [cell configImage:[NSString stringWithFormat:@"change_s%ld_r%ld", indexPath.section, indexPath.row] title:array[indexPath.row]];
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
