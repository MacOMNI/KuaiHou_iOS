//
//  WalletVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WalletVC.h"

#define kFloatingViewMinimumHeight 0
#define kFloatingViewMaximumHeight 330

@interface WalletVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewTopConstraint;

@property (nonatomic, strong) UIView                    *titleView;
@property (nonatomic, strong) UILabel                   *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *walletContentView;

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
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    
    return cell;

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取mainScrollview偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = 0;
    if (offsetY <= 60.0f) {
        alpha = 0.0f;
//        self.titleLabel.alpha = 0;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
        self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
    }else if (offsetY >= 100.0f){
        alpha = 1.0f;
        self.titleLabel.textColor = [UIColor blackColor];
        self.gk_statusBarStyle = UIStatusBarStyleDefault;
        self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
    }else{
        alpha = (offsetY - 60) / (100 - 60);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
