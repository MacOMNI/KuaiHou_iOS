//
//  SelPhotoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SelPhotoVC.h"
#import "SelPhotoCell.h"

@interface SelPhotoVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SelPhotoVC

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
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SelPhotoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([SelPhotoCell class])];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 560;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SelPhotoCell class]) forIndexPath:indexPath];
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
