//
//  FriendMessageVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/19.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FriendMessageVC.h"
#import "FriendMessageCell.h"
#import "UITableView+SCIndexView.h"

@interface FriendMessageVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray* indexArray;
@property(nonatomic,strong)NSMutableDictionary* friendDataDict;

@end

@implementation FriendMessageVC

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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FriendMessageCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FriendMessageCell class])];
    
    SCIndexViewConfiguration *configuration = [SCIndexViewConfiguration configurationWithIndexViewStyle:SCIndexViewStyleDefault];
    configuration.indexItemBackgroundColor = [UIColor clearColor];
    configuration.indicatorTextFont = kFont(12);
    configuration.indexItemTextColor = kMain_TextColor;
    configuration.indexItemSelectedBackgroundColor = [UIColor clearColor];
    configuration.indexItemSelectedTextColor = kMainColor;
    configuration.indexItemsSpace = 10;
    _tableView.sc_indexViewConfiguration = configuration;
    _tableView.sc_translucentForTableViewInNavigationBar = NO;
    
    _indexArray = [NSMutableArray arrayWithObject:@"↑"];
    _friendDataDict = [NSMutableDictionary new];
    NSArray *teamArray = @[@{@"title":@"新的朋友", @"image":@"message_newfriend"},@{@"title":@"我的关注", @"image":@"message_myheed"},@{@"title":@"我的粉丝", @"image":@"message_myfans"}];
    [_friendDataDict setObject:teamArray forKey:@"↑"];
    
    _tableView.sc_indexViewDataSource = _indexArray;
    [_tableView reloadData];
}

#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _indexArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* array = [_friendDataDict objectForKey:_indexArray[section]];
    return array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0001;
    }
    return 15;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section > 0) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = kMain_lineColor;
        UILabel *lab = [[UILabel alloc] init];
        lab.font = kFont(10);
        lab.textColor = kMain_TextColor_6;
        lab.text = self.indexArray[section];
        [lineView addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineView.mas_left).offset(12);
            make.centerY.equalTo(lineView.mas_centerY);
        }];
        return lineView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FriendMessageCell class]) forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray* array = [_friendDataDict objectForKey:_indexArray[indexPath.section]];
    if (indexPath.section == 0) {
        
        NSDictionary *dict = array[indexPath.row];
        FriendMessageCell *basecell = (FriendMessageCell *)cell;
        basecell.headImageView.image = [UIImage loadImageWithName:dict[@"image"]];
        basecell.titleLab.text = dict[@"title"];
    }
}

@end
