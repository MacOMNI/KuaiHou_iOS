//
//  MyDynamicsVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyDynamicsVC.h"
#import "MyDynamicsHeadCell.h"
#import "MyDynamicsTextCell.h"
#import "MyDynamicsImageCell.h"
#import "NearByDynamicsToolCell.h"

static NSString * testStr = @"湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。湖南沃趣娱乐传媒有限公司是一家专注互联网软件 开发和运营的企业。";

@interface MyDynamicsVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@end

@implementation MyDynamicsVC



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
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyDynamicsHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MyDynamicsHeadCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsToolCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([NearByDynamicsToolCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 40;
    }else if (indexPath.row == 1){
        return [MyDynamicsTextCell cellHeightWithContent:testStr isOpen:YES];
    }else if (indexPath.row == 2){
        return [MyDynamicsImageCell cellHeightWithImageCount:(int)indexPath.section];
    }else if (indexPath.row == 3){
        return 50;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MyDynamicsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyDynamicsHeadCell class]) forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){
        MyDynamicsTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDynamicsTextCell"];
        if (!cell) {
            cell = [[MyDynamicsTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyDynamicsTextCell"];
        }
        [cell  setDataWithContent:testStr userId:@(111) isForwarding:NO isOpen:YES];
        cell.openBlock = ^() {
        };
        return cell;
    }else if (indexPath.row == 2){
        // setCircleModelImageCount
        MyDynamicsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDynamicsImageCell"];
        if (!cell) {
            cell = [[MyDynamicsImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyDynamicsImageCell"];
        }
        [cell setCircleModelImageCount:(int)indexPath.section];
        return cell;
    }else if (indexPath.row == 3){
        NearByDynamicsToolCell *cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NearByDynamicsToolCell class]) forIndexPath:indexPath];
        cell.leftLayout.constant = 40;
        cell.moreBtn.hidden = YES;
        return cell;
    }
    return nil;
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
