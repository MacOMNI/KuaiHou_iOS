//
//  MainHomeVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainHomeVC.h"
#import "GKWBPageViewController.h"
#import "MainHomeHeadView.h"
#import "InfoDetailVC.h"
#import "WhereToPlayVC.h"
#import "FindTaPlayVC.h"
#import "DIYWhereToPlayFilterView.h"

@interface MainHomeVC ()<GKPageScrollViewDelegate, WMPageControllerDataSource, WMPageControllerDelegate, GKWBPageViewControllDelegate>

@property (nonatomic, strong) GKPageScrollView          *pageScrollView;
@property (nonatomic, strong) GKWBPageViewController    *pageVC;
@property (nonatomic, strong) MainHomeHeadView *headerView;
@property (nonatomic, strong) UIView                    *pageView;
@property (nonatomic, strong) NSArray                   *titles;
@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) UIButton *filterBtn;


@end

@implementation MainHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    UIImageView *bgImageView = [[UIImageView alloc] init];
//    bgImageView.image = [UIImage loadImageWithName:@"home_bg"];
//    bgImageView.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:bgImageView];
//    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//
//    }];
    
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    [self.pageScrollView reloadData];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


#pragma mark - 懒加载
- (GKPageScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
        _pageScrollView.mainTableView.backgroundColor = [UIColor clearColor];
        _pageScrollView.ceilPointHeight = SafeAreaTopStatueMin;
    }
    return _pageScrollView;
}

-(MainHomeHeadView *)headerView{
    if (!_headerView) {
        _headerView = [[MainHomeHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 300 +SafeAreaTopStatueMin)];
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
        _pageVC.menuItemWidth = 80;
        _pageVC.menuViewStyle = WMMenuViewStyleLine;
        
        _pageVC.titleSizeNormal     = 15.0f;
        _pageVC.titleSizeSelected   = 24.0f;
        _pageVC.titleColorNormal    = kMain_TextColor;
        _pageVC.titleColorSelected  = kMain_TextColor;
        
        // 进度条属性
        _pageVC.progressColor               = kMainColor;
        _pageVC.progressWidth               = 15.0f;
        _pageVC.progressHeight              = 3.0f;
        _pageVC.progressViewBottomSpace     = 10.0f;
        _pageVC.progressViewCornerRadius    = _pageVC.progressHeight / 2;
        _pageVC.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        // 调皮效果
        _pageVC.progressViewIsNaughty       = YES;
        _pageVC.view.backgroundColor = [UIColor clearColor];
        _pageVC.menuView.backgroundColor = [UIColor clearColor];
        
    }
    return _pageVC;
}

- (UIView *)pageView {
    if (!_pageView) {
        [self addChildViewController:self.pageVC];
        [self.pageVC didMoveToParentViewController:self];
        _pageView = self.pageVC.view;
        
        UIButton *filterBtn = [[UIButton alloc] init];
        [filterBtn setImage:[UIImage loadImageWithName:@"dynamics_filter"] forState:(UIControlStateNormal)];
        [filterBtn addTarget:self action:@selector(filterAction) forControlEvents:(UIControlEventTouchUpInside)];
        [self.pageVC.menuView addSubview:filterBtn];
        self.filterBtn = filterBtn;
        
        [filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(@(-15));
            make.centerY.mas_equalTo(self.pageVC.menuView.mas_centerY);
        }];
        
    }
    return _pageView;
}

// 去哪玩的筛选
-(void)filterAction{
    DIYWhereToPlayFilterView *diy = [[DIYWhereToPlayFilterView alloc] init];
    [diy showView];
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"去哪玩", @"找TA玩"];
    }
    return _titles;
}
- (NSArray *)childVCs {
    if (!_childVCs) {
        //        InfoDetailVC *homeVC = [InfoDetailVC new];
        
        
        _childVCs = @[[WhereToPlayVC new], [FindTaPlayVC new]];
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
    return CGRectMake(15, 0, kScreenSizeWidth - 15, 70);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat maxY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:pageController.menuView]);
    return CGRectMake(0, maxY, kScreenSizeWidth, kScreenSizeHeight - maxY - SafeAreaBottomHeight - 15);
}
#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
        int index = [info[@"index"] intValue];
    self.filterBtn.hidden = index != 0;
//    if (index == 0) {
//        <#statements#>
//    }
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
