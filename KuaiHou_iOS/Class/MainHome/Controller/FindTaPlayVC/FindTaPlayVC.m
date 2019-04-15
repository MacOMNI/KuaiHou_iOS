//
//  FindTaPlayVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FindTaPlayVC.h"
#import "FindTaPlayListCell.h"

@interface FindTaPlayVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) void(^listScrollViewDidScroll)(UIScrollView *scrollView);

@end

@implementation FindTaPlayVC

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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FindTaPlayListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([FindTaPlayListCell class])];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 460;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindTaPlayListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FindTaPlayListCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;

    
    //    return nil;
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
@end
