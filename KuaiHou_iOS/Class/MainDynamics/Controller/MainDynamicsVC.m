//
//  MainDynamicsVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainDynamicsVC.h"
#import "NearbyDynamicsVC.h"
#import "FavorableDynamicsVC.h"
#import "HeedDynamicsVC.h"
#import "SendDynamicsVC.h"
#import "DIYFilterView.h"
#import "InteractiveListVC.h"

@interface MainDynamicsVC ()


@property (nonatomic, strong) UILabel *messageTipLab;

@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) NSArray                   *titleList;

@property (nonatomic, strong) NearbyDynamicsVC *near;
@property (nonatomic, strong) FavorableDynamicsVC *favorable;
@property (nonatomic, strong) HeedDynamicsVC *heed;

@end

@implementation MainDynamicsVC

-(instancetype)init{
    if (self = [super init]) {
        self.menuItemWidth = 60;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeNormal     = 15.0f;
        self.titleSizeSelected   = 24.0f;
        self.titleColorNormal    = kMain_TextColor;
        self.titleColorSelected  = kMain_TextColor;
        self.progressColor               = kMainColor;
        self.progressWidth               = 15.0f;
        self.progressHeight              = 3.0f;
        self.progressViewBottomSpace     = 2.0f;
        self.progressViewCornerRadius    = self.progressHeight / 2;
        self.progressViewBottomSpace = 5;
        self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        // 调皮效果
        self.progressViewIsNaughty       = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
    [self createRightSendItem];
    
}

-(void)fixUI{
    
    
    UIButton *filterBtn = [[UIButton alloc] init];
    [filterBtn setImage:[UIImage loadImageWithName:@"dynamics_filter"] forState:(UIControlStateNormal)];
    [filterBtn addTarget:self action:@selector(filterAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:filterBtn];
    
    [filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@(-15));
        make.centerY.mas_equalTo(self.menuView.mas_centerY);
    }];
    
    
}

-(void)createRightSendItem{
    
    // 左
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
//    view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(messageAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage loadImageWithName:@"dynamics_message"] forState:(UIControlStateNormal)];
    leftBtn.frame = CGRectMake(0, 8, 24, 23);
    [view addSubview:leftBtn];
    
    self.messageTipLab = [[UILabel alloc] init];
    self.messageTipLab.font = kFont(12);
    self.messageTipLab.textColor = [UIColor whiteColor];
    self.messageTipLab.backgroundColor = kMainColor;
    self.messageTipLab.text = @"3";
    self.messageTipLab.textAlignment = NSTextAlignmentCenter;
    CGFloat strWidth = [MyTool getWidthWithTitle:self.messageTipLab.text font:12] + 5;
    strWidth = strWidth < 15 ? 15 : strWidth;
    [MyTool fixCornerradius:self.messageTipLab cornerRadius:(strWidth) * 0.5 Color:kMainColor Width:1];
    self.messageTipLab.frame = CGRectMake(15, 5, strWidth, strWidth);
    [view addSubview:self.messageTipLab];
    
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(void)messageAction{
    [self.navigationController pushViewController:[InteractiveListVC new] animated:YES];
}

-(void)filterAction{
    DIYFilterView *filter = [[DIYFilterView alloc] init];
    [filter setCommitBlock:^(NSInteger tag) {
        
    }];
    [filter showView];
    
    
}

-(void)sendAction{
    SendDynamicsVC *send = [SendDynamicsVC new];
    [self.navigationController pushViewController:send animated:YES];
}

- (NSArray *)childVCs {
    if (!_childVCs) {
        self.near = [NearbyDynamicsVC new];
        self.favorable = [FavorableDynamicsVC new];
        self.heed = [HeedDynamicsVC new];
        _childVCs = @[self.near, self.favorable, self.heed];
    }
    return _childVCs;
}

- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[@"附近", @"活动", @"关注"];
    }
    return _titleList;
}


#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.childVCs.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleList[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.childVCs[index];
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(15, 15, 400, 50.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat menuViewHeight = [self pageController:pageController preferredFrameForMenuView:self.menuView].size.height;
    return CGRectMake(0, menuViewHeight + 15, kScreenSizeWidth, kScreenSizeHeight - menuViewHeight - SafeAreaTopHeight-SafeAreaBottomHeight - 15);
}
#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
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
