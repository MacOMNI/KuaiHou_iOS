//
//  DynamicsDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DynamicsDetailVC.h"
#import "DIYSendToolbarView.h"

#import "NearByDynamicsHeadCell.h"
#import "NearByDynamicsTextCell.h"
#import "NearByDynamicsImageCell.h"
#import "NearByDynamicsToolCell.h"
#import "DynamicsContentCell.h"


@interface DynamicsDetailVC ()
@property (nonatomic, strong) DIYSendToolbarView *sendView;

@property (weak, nonatomic) IBOutlet UIView *commitView;
@property (weak, nonatomic) IBOutlet UILabel *commitLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSafe;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DynamicsDetailVC

static NSString * cellIdentifierIDHead = @"UserCireHeadCell";
static NSString * cellIdentifierIDText = @"UserCircleTextCell";
static NSString * cellIdentifierIDTool = @"UserCircleToolCell";
static NSString * cellIdentifierIDMoreImage = @"UserCircleImageCell";

static NSString * testStr = @"湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)fixUI{
    self.title = @"详情";
    self.bottomSafe.constant = SafeAreaBottom;
    [self setTextViewToolbar];
    [MyTool fixCornerradius:self.commitLab cornerRadius:15 Color:kMain_lineColor_C Width:0.5];
    self.commitView.userInteractionEnabled = YES;
    [self.commitView setTapActionWithBlock:^{
        self.sendView.hidden = NO;
        [self.sendView popToolbar];
    }];
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifierIDHead];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsToolCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifierIDTool];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DynamicsContentCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([DynamicsContentCell class])];
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

#pragma mark - UITableViewDelegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) { // 头上的时刻内容
        return 4;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 35;
    }
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [UILabel new];
        label.text = @"所有评论";
        label.textColor = kMain_TextColor_9;
        label.font = kFont(12);
        [view addSubview:label];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kMain_lineColor;
        [view addSubview:lineView];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(15);
            make.centerY.equalTo(view.mas_centerY);
        }];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view.mas_bottom);
            make.left.equalTo(view.mas_left).offset(15);
            make.right.equalTo(view.mas_right).offset(-15);
            make.height.mas_equalTo(@0.5);
        }];
        return view;
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            return 79;
        }else if (indexPath.row == 1){
            return [NearByDynamicsTextCell cellHeightWithContent:@"湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。" isOpen:YES];
        }else if (indexPath.row == 2){
            return [NearByDynamicsImageCell cellHeightWithImageCount:(int)indexPath.section];
        }else if (indexPath.row == 3){
            return 60;
        }
        return 0;
    }else{
        return [DynamicsContentCell getHeightByContent:testStr userName:@"哈哈哈"];
    }
    
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NearByDynamicsHeadCell *cell = (NearByDynamicsHeadCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifierIDHead forIndexPath:indexPath];
            
            return cell;
        }else if (indexPath.row == 1){
            cell = (NearByDynamicsTextCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifierIDText];
            if (!cell) {
                cell = [[NearByDynamicsTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifierIDText];
            }
            [(NearByDynamicsTextCell *)cell  setDataWithContent:@"湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。" userId:@(111) isForwarding:NO isOpen:YES];
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
            NearByDynamicsToolCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifierIDTool forIndexPath:indexPath];
            return cell;
        }
    }else{
        DynamicsContentCell *contentCell = (DynamicsContentCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DynamicsContentCell class]) forIndexPath:indexPath];
        [contentCell setContent:testStr userId:@"666" ToUserName:@"哈哈哈"];
        return contentCell;
    }
    
    
    return cell;
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
