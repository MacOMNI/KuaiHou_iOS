//
//  FavorableDynamicsVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FavorableDynamicsVC.h"
#import "NearByDynamicsHeadCell.h"
#import "NearByDynamicsTextCell.h"
#import "NearByDynamicsImageCell.h"
#import "DynamicsDetailVC.h"

#import "FavorableDynamicsCell.h"

static NSString * cellIdentifierIDHead = @"UserCireHeadCell";
static NSString * cellIdentifierIDText = @"UserCircleTextCell";
static NSString * cellIdentifierIDTool = @"UserCircleToolCell";
static NSString * cellIdentifierIDMoreImage = @"UserCircleImageCell";

static NSString * testStr = @"湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。";


@interface FavorableDynamicsVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FavorableDynamicsVC

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifierIDHead];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FavorableDynamicsCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FavorableDynamicsCell class])];
    
}

#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section % 2 == 0) {
        return 3;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 79;
    }else if (indexPath.row == 1){
        return [NearByDynamicsTextCell cellHeightWithContent:testStr isOpen:YES] + 10;
    }else if (indexPath.row == 2){
        return [NearByDynamicsImageCell cellHeightWithImageCount:(int)indexPath.section] + 10;
    }else if (indexPath.row == 3){
        return 60;
    }
    return 0;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    if (indexPath.row == 0) {
        NearByDynamicsHeadCell *cell = (NearByDynamicsHeadCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifierIDHead forIndexPath:indexPath];
        cell.sexIconView.hidden = YES;
        cell.ageLab.hidden = YES;
        cell.distanceBtn.hidden = YES;
        cell.nickNameLab.textColor = kMain_TextColor_6;
        return cell;
    }else if (indexPath.row == 1){
        cell = (NearByDynamicsTextCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifierIDText];
        if (!cell) {
            cell = [[NearByDynamicsTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierIDText];
        }
        [(NearByDynamicsTextCell *)cell  setDataWithContent:testStr userId:@(111) isForwarding:NO isOpen:YES];
        ((NearByDynamicsTextCell*)cell).openBlock = ^() {
        };
        return cell;
    }else if (indexPath.row == 2){
        // setCircleModelImageCount
        cell = (NearByDynamicsImageCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifierIDMoreImage];
        if (!cell) {
            cell = [[NearByDynamicsImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierIDMoreImage];
        }
        [(NearByDynamicsImageCell *)cell setCircleModelImageCount:(int)indexPath.section];
        return cell;
    }
    else if (indexPath.row == 3){
        FavorableDynamicsCell *cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FavorableDynamicsCell class]) forIndexPath:indexPath];
        return cell;
    }
    
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
