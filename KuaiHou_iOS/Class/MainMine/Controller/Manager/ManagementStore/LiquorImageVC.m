//
//  LiquorImageVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "LiquorImageVC.h"
#import "StoreBoxTypeVC.h"
#import "LiquorImageDataVC.h"


@interface LiquorImageVC ()

@property(nonatomic,strong) WMPageController *pageVC;
@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) NSArray                   *titleList;

@end

@implementation LiquorImageVC


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
}

-(void)fixUI{
    self.title = @"酒水图片";
}

- (NSArray *)childVCs {
    if (!_childVCs) {
        LiquorImageDataVC *homeVC = [LiquorImageDataVC new];
        _childVCs = @[homeVC, homeVC, homeVC, homeVC, homeVC, homeVC, homeVC];
    }
    return _childVCs;
}

- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[@"啤酒", @"洋酒", @"红酒", @"鸡尾酒", @"软饮", @"小吃", @"其他"];
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
    return CGRectMake(15, 10, kScreenSizeWidth - 15, 50.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat menuViewHeight = [self pageController:pageController preferredFrameForMenuView:self.menuView].size.height;
    return CGRectMake(0, menuViewHeight, kScreenSizeWidth, kScreenSizeHeight - menuViewHeight - SafeAreaTopHeight - 10);
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
