//
//  PartnerIncomeVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "PartnerIncomeVC.h"
#import "PartnerChildVC.h"
#import "PartnerVC.h"

@interface PartnerIncomeVC ()

@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) NSArray                   *titleList;

@end

@implementation PartnerIncomeVC

-(instancetype)init{
    if (self = [super init]) {
        self.menuItemWidth = 100;
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
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"团队" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.title = @"合伙人收益";
}

-(void)rightAction{
    
    
    if ([[self backViewController] isKindOfClass:[PartnerVC class]]) {
//        NSLog(@"我从这个页面过来的");
        [self.navigationController popViewControllerAnimated:YES];
    }else{
//        NSLog(@"我没来过");
        [self.navigationController pushViewController:[PartnerVC new] animated:YES];
    }
}

- (UIViewController*)backViewController{
    NSInteger myIndex = [self.navigationController.viewControllers indexOfObject:self];
    if( myIndex !=0 && myIndex !=NSNotFound) {
        return [self.navigationController.viewControllers objectAtIndex:myIndex-1];
        
    }else{
        return self;
        
    }
    
}


- (NSArray *)childVCs {
    if (!_childVCs) {
        _childVCs = @[[PartnerChildVC new], [PartnerChildVC new]];
    }
    return _childVCs;
}

- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[@"昨日收益", @"总收益"];
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
    return CGRectMake(15, 15, kScreenSizeWidth - 15, 50.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat menuViewHeight = [self pageController:pageController preferredFrameForMenuView:self.menuView].size.height;
    return CGRectMake(0, menuViewHeight + 15, kScreenSizeWidth, kScreenSizeHeight - menuViewHeight - SafeAreaTopHeight - 15);
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
