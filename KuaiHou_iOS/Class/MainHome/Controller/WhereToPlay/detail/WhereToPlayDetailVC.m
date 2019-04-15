//
//  WhereToPlayDetailVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "WhereToPlayDetailVC.h"
#import "WhereToPlayDetailHeadView.h"
#import "GKWBPageViewController.h"
#import "WhereToPlayDetailInfoVC.h"
#import "WhereToPlayDetailActivityVC.h"
#import "InfoDetailVC.h"
#import "WhereConsumeVC.h"

@interface WhereToPlayDetailVC ()<GKPageScrollViewDelegate, WMPageControllerDataSource, WMPageControllerDelegate, GKWBPageViewControllDelegate>

@property (nonatomic, strong) GKPageScrollView          *pageScrollView;
@property (nonatomic, strong) WhereToPlayDetailHeadView *headerView;
@property (nonatomic, strong) GKWBPageViewController    *pageVC;
@property (nonatomic, strong) UIView                    *pageView;
@property (nonatomic, strong) NSArray                   *titles;
@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) UIView                    *titleView;
@property (nonatomic, strong) UILabel                   *titleLabel;

@end

@implementation WhereToPlayDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gk_navBarAlpha = 0.0f;
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    self.gk_navTitleView = self.titleView;
    [self.view addSubview:self.pageScrollView];
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.pageScrollView reloadData];
    [self mainTableViewDidScroll:self.pageScrollView.mainTableView];
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:[UIImage loadImageWithName:@"change_sava"] forState:(UIControlStateNormal)];
    [button setTitle:@"  预定" forState:(UIControlStateNormal)];
    button.titleLabel.font = kFont(18);
    [button setImage:[UIImage loadImageWithName:@"home_btnicon"] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(37.5);
        make.right.equalTo(self.view.mas_right).offset(-37.5);
        make.bottom.equalTo(self.view.mas_bottom).offset(-25);
        make.height.mas_equalTo(@40);
    }];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)more{
    
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
        self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithImageName:@"wb_more" target:self action:@selector(more)];
        
    }else if (offsetY >= 100.0f) {
        alpha = 1.0f;
        
        self.gk_statusBarStyle = UIStatusBarStyleDefault;
        self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
        
        self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:[self changeImageWithColor:[UIColor blackColor] image:[UIImage imageNamed:@"wb_more"]] target:self action:@selector(more)];
        
        // 92
        self.titleLabel.alpha = 1;
        
    }else {
        alpha = (offsetY - 60) / (100 - 60);
        
        if (alpha > 0.8) {
            self.gk_statusBarStyle = UIStatusBarStyleDefault;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_black") target:self action:@selector(back)];
            self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:[self changeImageWithColor:[UIColor blackColor] image:[UIImage imageNamed:@"wb_more"]] target:self action:@selector(more)];
            // 92
            self.titleLabel.alpha = (offsetY - 92) / (100 - 92);
            
        }else {
            self.titleLabel.alpha = 0;
            
            self.gk_statusBarStyle = UIStatusBarStyleLightContent;
            self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:GKImage(@"btn_back_white") target:self action:@selector(back)];
            self.gk_navRightBarButtonItem = [UIBarButtonItem itemWithImageName:@"wb_more" target:self action:@selector(more)];
        }
    }
    
    self.gk_navBarAlpha = alpha;
    
    
    // 头图下拉
    [self.headerView scrollViewDidScroll:scrollView.contentOffset.y];
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
    return CGRectMake(0, maxY, kScreenSizeWidth, kScreenSizeHeight - maxY - SafeAreaTopHeight - 15);
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
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

- (WhereToPlayDetailHeadView *)headerView {
    if (!_headerView) {
        _headerView = [[WhereToPlayDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeWidth)];
    }
    return _headerView;
}

- (GKWBPageViewController *)pageVC {
    if (!_pageVC) {
        _pageVC = [[GKWBPageViewController alloc] init];
        _pageVC.dataSource = self;
        _pageVC.delegate = self;
        _pageVC.scrollDelegate = self;
        
        //@property (nonatomic, nullable, copy) NSArray<NSNumber *> *itemsWidths;
        // 菜单属性
        _pageVC.itemsWidths = @[@50, @60, @100, @120];
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
        
    }
    return _pageView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"资料", @"活动", @"消费参考", @"可能邂逅的人"];
    }
    return _titles;
}

- (NSArray *)childVCs {
    if (!_childVCs) {
        _childVCs = @[[WhereToPlayDetailInfoVC new], [WhereToPlayDetailActivityVC new], [WhereConsumeVC new], [InfoDetailVC new]];
    }
    return _childVCs;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth - 120, 44)];
        _titleView.backgroundColor = [UIColor clearColor];
        
        [_titleView addSubview:self.titleLabel];
        
        self.titleLabel.frame = CGRectMake(0, 0, kScreenSizeWidth - 120, 44);
        [self setName:@"圣都KTV" detail:@"（划得来 店号：9527）" targetlab:self.titleLabel];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"详情";
        _titleLabel.alpha = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

-(void)setName:(NSString *)name detail:(NSString *)detail targetlab:(UILabel *)label{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", name, detail]];
    [attri addAttribute:NSForegroundColorAttributeName value:kMain_TextColor range:NSMakeRange(0, name.length)];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, name.length)];
    [attri addAttribute:NSForegroundColorAttributeName value:kMain_TextColor_9 range:NSMakeRange(name.length, detail.length)];
    [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(name.length, detail.length)];
    label.attributedText = attri;
    
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
