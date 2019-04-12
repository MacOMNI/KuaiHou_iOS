//
//  WalletVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WalletVC.h"
#import "MainMineListCell.h"
#import "AppCurrencyVC.h"
#import "PartnerIncomeVC.h"
#import "OtherIncomeVC.h"
#import "QuitMoneyVC.h"
#import "BillVC.h"
#import "VerifiedVC.h"
#import "SettlementDetaildVC.h"

#define kFloatingViewMinimumHeight 0
#define kFloatingViewMaximumHeight 340

@interface WalletVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewTopConstraint;

@property (nonatomic, strong) UIView                    *titleView;
@property (nonatomic, strong) UILabel                   *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *walletContentView;

@property (nonatomic, strong) NSArray *listArray;

@property (weak, nonatomic) IBOutlet UIView *itmeView0;
@property (weak, nonatomic) IBOutlet UIView *itmeView1;
@property (weak, nonatomic) IBOutlet UIView *itmeView2;


@end

@implementation WalletVC

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
        _titleView.backgroundColor = [UIColor clearColor];
        
        [_titleView addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.titleView);
        }];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"钱包";
        _titleLabel.alpha = 1;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (void)dealloc {
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

-(void)fixUI{
    _walletContentView.layer.shadowColor = [UIColor colorWithRed:107/255.0 green:107/255.0 blue:107/255.0 alpha:0.4].CGColor;
    _walletContentView.layer.shadowOffset = CGSizeMake(0,0);
    _walletContentView.layer.shadowOpacity = 1;
    _walletContentView.layer.shadowRadius = 7;
    _walletContentView.layer.cornerRadius = 5;
    
    self.gk_navBarAlpha = 0.0f;
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    self.gk_navTitleView = self.titleView;
    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.contentInset = UIEdgeInsetsMake(kFloatingViewMaximumHeight, 0, 0, 0);
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainMineListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainMineListCell class])];
    
    self.listArray = @[@{@"image":@"wallet_item0", @"title":@"结算明细"},@{@"image":@"wallet_item1", @"title":@"账单"},@{@"image":@"wallet_item2", @"title":@"实名认证"}];
    
    [_itmeView0 setTapActionWithBlock:^{ // 快币
        [self.navigationController pushViewController:[AppCurrencyVC new] animated:YES];
    }];
    
    [_itmeView1 setTapActionWithBlock:^{ // 合伙人收益
        [self.navigationController pushViewController:[PartnerIncomeVC new] animated:YES];
    }];
    
    [_itmeView2 setTapActionWithBlock:^{ // 其他收益
        [self.navigationController pushViewController:[OtherIncomeVC new] animated:YES];
    }];
    
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainMineListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainMineListCell class]) forIndexPath:indexPath];
    NSDictionary *dict = self.listArray[indexPath.row];
    cell.titleLab.text = dict[@"title"];
    cell.headImageView.image = [UIImage loadImageWithName:dict[@"image"]];
    cell.lineView.hidden = YES;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[SettlementDetaildVC new] animated:YES];
    }else if (indexPath.row == 1){ // 账单
        [self.navigationController pushViewController:[BillVC new] animated:YES];
    }else{
        [self.navigationController pushViewController:[VerifiedVC new] animated:YES];
    }
    
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= kFloatingViewMinimumHeight) {
            self.headViewHeightConstraint.constant = - offset.y;
        } else {
            self.headViewHeightConstraint.constant = kFloatingViewMinimumHeight;
        }
        
        // 获取mainScrollview偏移量
        CGFloat offsetY = offset.y;
        NSLog(@"%f", offsetY);
        CGFloat alpha = 0;
        if (offsetY <= -280.0f) {
            alpha = 0.0f;
            //        self.titleLabel.alpha = 0;
            self.titleLabel.textColor = [UIColor whiteColor];
            self.gk_statusBarStyle = UIStatusBarStyleLightContent;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
        }else if (offsetY >= -240.0f){
            alpha = 1.0f;
            self.titleLabel.textColor = [UIColor blackColor];
            self.gk_statusBarStyle = UIStatusBarStyleDefault;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
        }else{
            alpha = (offsetY + 280) / (-240 + 280);
            if (alpha > 0.8) {
                self.gk_statusBarStyle = UIStatusBarStyleDefault;
                self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
                self.titleLabel.textColor = [UIColor blackColor];
            }else{
                self.titleLabel.textColor = [UIColor whiteColor];
                self.gk_statusBarStyle = UIStatusBarStyleLightContent;
                self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
            }
        }
        
        self.gk_navBarAlpha = alpha;
    }
}
- (IBAction)quitAction:(UIButton *)sender {
    [self.navigationController pushViewController:[QuitMoneyVC new] animated:YES];
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
