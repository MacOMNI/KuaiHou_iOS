//
//  DIYReportView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYReportView.h"
#import "OrderComplaintCell.h"

@interface DIYReportView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DIYReportView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYReportView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 275;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OrderComplaintCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OrderComplaintCell class])];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.dataArray = @[@"广告、营销",@"诈骗、托儿",@"色情低俗",@"恶意骚扰、不文明行为",@"虚假信息",@"其他"];
        [self.tableView reloadData];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderComplaintCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OrderComplaintCell class]) forIndexPath:indexPath];
    
    cell.titleLab.text = self.dataArray[indexPath.row];
    cell.iconBtn.selected = self.currentIndex == indexPath.row;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndex = indexPath.row;
    [self.tableView reloadData];
}
- (IBAction)itemAction:(UIButton *)sender {
    if (sender.tag == 0) { // 取消
        
    }else{
        
    }
    [self hiddenView];
}


@end
