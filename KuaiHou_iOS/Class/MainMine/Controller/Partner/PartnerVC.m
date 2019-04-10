//
//  PartnerVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/10.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "PartnerVC.h"
#import "GKWBPageViewController.h"
#import "PartnerChildVC.h"
#import "PartnerHeadView.h"
#import "ChangeInfoHeadView.h"
#import "MaterialVC.h"
#import "CleanChatView.h"
#import "OpenPartnerVC.h"

@interface PartnerVC ()<GKPageScrollViewDelegate, WMPageControllerDataSource, WMPageControllerDelegate, GKWBPageViewControllDelegate>

@property (nonatomic, strong) GKPageScrollView          *pageScrollView;
@property (nonatomic, strong) GKWBPageViewController    *pageVC;
@property (nonatomic, strong) PartnerHeadView           *headerView;
@property (nonatomic, strong) UIView                    *pageView;
@property (nonatomic, strong) NSArray                   *titles;
@property (nonatomic, strong) NSArray                   *childVCs;

@end

@implementation PartnerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
    
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);

    }];
    [self.pageScrollView reloadData];
//    [self mainTableViewDidScroll:self.pageScrollView.mainTableView];
    
    CleanChatView *tip = [[CleanChatView alloc] init];
    tip.titleLab.text = @"温馨提示";
    tip.tipLab.text = @"您的合伙人身份已过期，期间您的收益 将无法进入余额，请及时续费！";
    
    [tip.commitBtn setTitle:@"续费" forState:(UIControlStateNormal)];
    [tip setCommitBlock:^{
        OpenPartnerVC *open = [OpenPartnerVC new];
        open.type = 1;
        [self.navigationController pushViewController:open animated:YES];
    }];
    [tip showView];
    
    
}
-(void)fixUI{
    self.title = @"合伙人";
    
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"收益" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void)rightAction{
    
}


#pragma mark - 懒加载
- (GKPageScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
        _pageScrollView.mainTableView.backgroundColor = [UIColor whiteColor];
        _pageScrollView.ceilPointHeight = 0;
    }
    return _pageScrollView;
}
-(PartnerHeadView *)headerView{
    if (!_headerView) {
        _headerView = [[PartnerHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 60)];
    }
    return _headerView;
}

- (GKWBPageViewController *)pageVC {
    if (!_pageVC) {
        _pageVC = [[GKWBPageViewController alloc] init];
        _pageVC.dataSource = self;
        _pageVC.delegate = self;
        _pageVC.scrollDelegate = self;
        
        // 菜单属性
        _pageVC.menuItemWidth = 60;
        _pageVC.menuViewStyle = WMMenuViewStyleLine;
        
        _pageVC.titleSizeNormal     = 15.0f;
        _pageVC.titleSizeSelected   = 24.0f;
        _pageVC.titleColorNormal    = kMain_TextColor;
        _pageVC.titleColorSelected  = kMain_TextColor;
        
        // 进度条属性
        _pageVC.progressColor               = kMainColor;
        _pageVC.progressWidth               = 15.0f;
        _pageVC.progressHeight              = 3.0f;
        _pageVC.progressViewBottomSpace     = 2.0f;
        _pageVC.progressViewCornerRadius    = _pageVC.progressHeight / 2;
        _pageVC.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        // 调皮效果
        _pageVC.progressViewIsNaughty       = YES;
        
        
    }
    return _pageVC;
}
- (UIView *)pageView {
    if (!_pageView) {
        [self addChildViewController:self.pageVC];
        [self.pageVC didMoveToParentViewController:self];
        
        _pageView = self.pageVC.view;
        
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [button setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
        button.titleLabel.font = kFont(15);
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"素材库"];
        NSRange titleRange = {0,[title length]};
        [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
        [button setAttributedTitle:title
                          forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dataAction) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.pageVC.menuView addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(@(-15));
            make.centerY.mas_equalTo(self.pageVC.menuView.mas_centerY);
        }];
    }
    return _pageView;
}
-(void)dataAction{
    [self.navigationController pushViewController:[MaterialVC new] animated:YES];
}
- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"全部", @"直推", @"一度", @"二度"];
    }
    return _titles;
}
- (NSArray *)childVCs {
    if (!_childVCs) {
//        InfoDetailVC *homeVC = [InfoDetailVC new];
        
        
        _childVCs = @[[PartnerChildVC new], [PartnerChildVC new], [PartnerChildVC new], [PartnerChildVC new]];
    }
    return _childVCs;
}

#pragma mark - GKPageScrollViewDelegate
- (UIView *)headerViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.headerView;
}

- (UIView *)pageViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.pageView;
}

- (NSArray<id<GKPageListViewDelegate>> *)listViewsInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.childVCs;
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollView {
    // 头图下拉
    [self.headerView scrollViewDidScroll:scrollView.contentOffset.y];
}


#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.childVCs.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.childVCs[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(15, 0, kScreenSizeWidth - 15, 50.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat maxY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:pageController.menuView]);
    return CGRectMake(0, maxY, kScreenSizeWidth, kScreenSizeHeight - maxY - SafeAreaTopHeight);
}

#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
//    int index = [info[@"index"] intValue];
    
    
//        NSLog(@"加载数据%@", info);
}

#pragma mark - GKWBPageViewControllDelegate
- (void)pageScrollViewWillBeginScroll {
    [self.pageScrollView horizonScrollViewWillBeginScroll];
}

- (void)pageScrollViewDidEndedScroll {
    [self.pageScrollView horizonScrollViewDidEndedScroll];
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
