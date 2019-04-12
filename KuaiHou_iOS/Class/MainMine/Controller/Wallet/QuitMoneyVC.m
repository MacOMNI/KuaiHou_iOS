//
//  QuitMoneyVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "QuitMoneyVC.h"
#import "QuitMoneyTextFieldTableViewCell.h"
#import "QuitMoneyCodeCell.h"

#define kFloatingViewMinimumHeight 0
#define kFloatingViewMaximumHeight 130

@interface QuitMoneyVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewTopConstraint;

@property (nonatomic, assign) BOOL alipayIsOpen; // 是否展开支付宝
@property (nonatomic, assign) BOOL cardIsOpen;  // 是否展开银行卡

@property (nonatomic, assign) BOOL isRead;  // 是否选中阅读

@property (nonatomic, strong) NSArray *listArray;

@end

@implementation QuitMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    self.title = @"提现";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.contentInset = UIEdgeInsetsMake(kFloatingViewMaximumHeight, 0, 0, 0);
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    self.alipayIsOpen = NO;
    self.cardIsOpen = NO;
    self.isRead = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QuitMoneyTextFieldTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([QuitMoneyTextFieldTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QuitMoneyCodeCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([QuitMoneyCodeCell class])];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return self.alipayIsOpen ? 1 : 0;
    }else if (section == 2){
        return self.cardIsOpen ? 4 : 0;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc] init];
    bgView.userInteractionEnabled = YES;
    [bgView setTapActionWithBlock:^{
        if (section == 1) {
            self.listArray = @[@"请输入支付宝账号"];
            self.cardIsOpen = NO;
            self.alipayIsOpen = !self.alipayIsOpen;
        }else if (section == 2){
            self.listArray = @[@"请输入持卡人姓名",@"请输入银行卡号",@"请输入手机号",@"请输入验证码"];
            self.alipayIsOpen = NO;
            self.cardIsOpen = !self.cardIsOpen;
        }
        [self.tableView reloadData];
    }];
    if (section == 0) {
        UILabel * title = [MyTool setupLabel:@"提现方式" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
        [bgView addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView.mas_left).offset(15);
            make.centerY.equalTo(bgView.mas_centerY);
        }];
        
        return bgView;
    }else if (section == 1 || section == 2){
        UIImageView *imageView = [UIImageView new];
        imageView.image = section == 1 ? [UIImage loadImageWithName:@"quit_alipay"] : [UIImage loadImageWithName:@"quit_card"];
        [bgView addSubview:imageView];
        
        UILabel *title = [MyTool setupLabel:@"提现方式" textAlignment:(NSTextAlignmentLeft) textColor:kMain_TextColor font:kFont(15)];
        title.text = section == 1 ? @"提现到支付宝" : @"提现到银行卡";
        [bgView addSubview:title];
        
        UIButton *iconBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [iconBtn setImage:[UIImage loadImageWithName:@"base_unsel"] forState:(UIControlStateNormal)];
        [iconBtn setImage:[UIImage loadImageWithName:@"base_sel"] forState:(UIControlStateSelected)];
        if (section == 1) {
            iconBtn.selected = self.alipayIsOpen;
        }else if (section == 2){
            iconBtn.selected = self.cardIsOpen;
        }
        [bgView addSubview:iconBtn];
        
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView.mas_left).offset(15);
            make.centerY.equalTo(bgView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).offset(15);
            make.centerY.equalTo(bgView.mas_centerY);
        }];
        
        [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView.mas_right).offset(-15);
            make.centerY.equalTo(bgView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        
        return bgView;
        
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        QuitMoneyTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QuitMoneyTextFieldTableViewCell class]) forIndexPath:indexPath];
        
        cell.textField.placeholder = self.listArray[indexPath.row];
        
        return cell;
    }else if (indexPath.section == 2){
        if (indexPath.row == 2) {
            QuitMoneyCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QuitMoneyCodeCell class]) forIndexPath:indexPath];
            cell.textField.placeholder = self.listArray[indexPath.row];
            return cell;
        }else{
            QuitMoneyTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QuitMoneyTextFieldTableViewCell class]) forIndexPath:indexPath];
            
            cell.textField.placeholder = self.listArray[indexPath.row];
            
            return cell;
        }
        
    }
    
    
    return nil;
//
//    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= kFloatingViewMinimumHeight) {
            self.headViewHeightConstraint.constant = - offset.y;
        } else {
            self.headViewHeightConstraint.constant = kFloatingViewMinimumHeight;
        }
    }
}

- (IBAction)readAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.isRead = sender.selected;
}
- (IBAction)termsAction:(UIButton *)sender {
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
