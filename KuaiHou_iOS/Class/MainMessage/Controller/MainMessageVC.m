//
//  MainMessageVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainMessageVC.h"
#import "NewMessageVC.h"
#import "FriendMessageVC.h"

@interface MainMessageVC ()

@property (nonatomic, strong) NSArray                   *childVCs;
@property (nonatomic, strong) NSArray                   *titleList;

@end

@implementation MainMessageVC

-(instancetype)init{
    if (self = [super init]) {
        self.menuItemWidth = 70;
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
        self.showOnNavigationBar  = YES;
        // 调皮效果
        self.progressViewIsNaughty       = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)questionAction{
}

#pragma mark 选择器的delegate
- (NSArray *)childVCs {
    if (!_childVCs) {
        _childVCs = @[[NewMessageVC new], [FriendMessageVC new]];
    }
    return _childVCs;
}

- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[@"消息", @"好友"];
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
    return CGRectMake(15, 0, kScreenSizeWidth - 30, 50.0f);
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    return CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeHeight - SafeAreaTopHeight-SafeAreaBottomHeight);
}
#pragma mark - WMPageControllerDelegate
- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
//    NSLog(@"%@", info);
    
    UIImage *image = [info[@"index"] intValue] == 0 ? [UIImage new] : [UIImage loadImageWithName:@"message_friendsearch"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(questionAction)];
    
}

@end
