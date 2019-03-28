//
//  StoreContentVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StoreContentVC.h"
#import "NearByDynamicsHeadCell.h"
#import "StoreContentTextCell.h"

static NSString *testStr = @"很好的一次体验,服务及环境都非常不错，下次还来。";

@interface StoreContentVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSafe;

@end

@implementation StoreContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"网店评论";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NearByDynamicsHeadCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([NearByDynamicsHeadCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([StoreContentTextCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([StoreContentTextCell class])];
    
    self.bottomSafe.constant = SafeAreaBottom;
    
    [self.contentBgView setTapActionWithBlock:^{ //评论
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 74;
    }else if (indexPath.row == 1){
        NSLog(@"%f", [StoreContentTextCell getHeightByContent:testStr]);
        return [StoreContentTextCell getHeightByContent:testStr];
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NearByDynamicsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NearByDynamicsHeadCell class]) forIndexPath:indexPath];
        cell.distanceBtn.hidden = YES;
        
        return cell;
    }else if(indexPath.row == 1){
        StoreContentTextCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StoreContentTextCell class]) forIndexPath:indexPath];
        cell.content = testStr;
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
