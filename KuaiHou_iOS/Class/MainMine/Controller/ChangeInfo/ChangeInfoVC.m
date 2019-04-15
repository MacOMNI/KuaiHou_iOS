//
//  ChangeInfoVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/21.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ChangeInfoVC.h"
#import "ChangeInfoHeadView.h"
#import "GKWBPageViewController.h"

#import "InfoDetailVC.h"
#import "MyDynamicsVC.h"
#import "MyPhotoVC.h"
#import "MyVideoVC.h"

@interface ChangeInfoVC () <GKPageScrollViewDelegate, WMPageControllerDataSource, WMPageControllerDelegate, GKWBPageViewControllDelegate>

@property (nonatomic, strong) GKPageScrollView          *pageScrollView;
@property (nonatomic, strong) ChangeInfoHeadView        *headerView;
@property (nonatomic, strong) GKWBPageViewController    *pageVC;
@property (nonatomic, strong) UIView                    *pageView;
@property (nonatomic, strong) NSArray                   *titles;
@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) UIView                    *titleView;
@property (nonatomic, strong) UILabel                   *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *savaBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerX;
@property (weak, nonatomic) IBOutlet UILabel *savaTitle;

@end

@implementation ChangeInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gk_navBarAlpha = 0.0f;
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    self.gk_navTitleView = self.titleView;
//    self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithImageName:<#(NSString *)#> target:<#(id)#> action:<#(SEL)#>];
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.pageScrollView reloadData];
    [self mainTableViewDidScroll:self.pageScrollView.mainTableView];
    
    [self.view bringSubviewToFront:self.savaBgView];
    
    [self.headerView reloadViewByArray:@[@"",@"",@"",@"",@""]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 隐藏系统导航栏
//    [self.navigationController setNavigationBarHidden:NO];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)more {
    
}
- (IBAction)savaBtn:(id)sender {
}


- (UIImage *)changeImageWithColor:(UIColor *)color image:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 偏移量 < 60 0
    // 偏移量 60 - 100 导航栏0-1渐变
    // 偏移量 > 100 1
    
    CGFloat alpha = 0;
    if (offsetY <= 60.0f) {
        alpha = 0.0f;
        
        self.titleLabel.alpha = 0;
        
        self.gk_statusBarStyle = UIStatusBarStyleLightContent;
        self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
//        self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithImageName:@"wb_more" target:self action:@selector(more)];
        
    }else if (offsetY >= 100.0f) {
        alpha = 1.0f;
        
        self.gk_statusBarStyle = UIStatusBarStyleDefault;
        self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
        
//        self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:[self changeImageWithColor:[UIColor blackColor] image:[UIImage imageNamed:@"wb_more"]] target:self action:@selector(more)];
        
        // 92
        self.titleLabel.alpha = 1;
        
    }else {
        alpha = (offsetY - 60) / (100 - 60);
        
        if (alpha > 0.8) {
            self.gk_statusBarStyle = UIStatusBarStyleDefault;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
//            self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:[self changeImageWithColor:[UIColor blackColor] image:[UIImage imageNamed:@"wb_more"]] target:self action:@selector(more)];
            
            // 92
            self.titleLabel.alpha = (offsetY - 92) / (100 - 92);
            
        }else {
            self.titleLabel.alpha = 0;
            
            self.gk_statusBarStyle = UIStatusBarStyleLightContent;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
//            self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithImageName:@"wb_more" target:self action:@selector(more)];
        }
    }
    
    self.gk_navBarAlpha = alpha;
    
    
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
    return CGRectMake(15, 0, 240, 60.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat maxY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:pageController.menuView]);
    return CGRectMake(0, maxY, kScreenSizeWidth, kScreenSizeHeight - maxY - SafeAreaTopHeight);
}

#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
    int index = [info[@"index"] intValue];
    
    if (index == 0) {
        self.savaBgView.hidden = NO;
        self.centerX.constant = - 20;
        self.savaTitle.text = @"保存";
    }else if (index == 1){
        self.savaBgView.hidden = NO;
        self.centerX.constant = -40;
        self.savaTitle.text = @"发布动态";
    }else if (index == 2){
        self.savaBgView.hidden = YES;
    }else{
        self.savaBgView.hidden = YES;
    }
    
//    NSLog(@"加载数据%@", info);
}

#pragma mark - GKWBPageViewControllDelegate
- (void)pageScrollViewWillBeginScroll {
    [self.pageScrollView horizonScrollViewWillBeginScroll];
}

- (void)pageScrollViewDidEndedScroll {
    [self.pageScrollView horizonScrollViewDidEndedScroll];
}
#pragma mark - 懒加载
- (GKPageScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
        _pageScrollView.mainTableView.backgroundColor = [UIColor whiteColor];
    }
    return _pageScrollView;
}

- (ChangeInfoHeadView *)headerView {
    if (!_headerView) {
        _headerView = [[ChangeInfoHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, kWBHeaderHeight)];
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
    }
    return _pageView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"资料", @"动态", @"图片", @"视频"];
    }
    return _titles;
}


- (NSArray *)childVCs {
    if (!_childVCs) {
        InfoDetailVC *homeVC = [InfoDetailVC new];
        
        MyDynamicsVC *wbVC = [MyDynamicsVC new];
        
        MyPhotoVC *videoVC = [MyPhotoVC new];
        
        MyVideoVC *storyVC = [MyVideoVC new];
        
        _childVCs = @[homeVC, wbVC, videoVC, storyVC];
    }
    return _childVCs;
}

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
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"时光无声";
        _titleLabel.alpha = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}




@end
