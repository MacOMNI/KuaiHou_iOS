//
//  MainMessageVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainMessageVC.h"
#import "FSScrollContentView.h"
#import "NewMessageVC.h"
#import "FriendMessageVC.h"

@interface MainMessageVC ()<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>

@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;

@property (nonatomic, assign) int selectIndex;

@end

@implementation MainMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
}
-(void)setUI{
    self.navigationItem.title = @"";
    NSArray *items = @[@"消息", @"好友"];
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 0, 130, 40) titles:items delegate:self indicatorType:FSIndicatorTypeDIY];
    self.titleView.indicatorExtension = 15;
    self.titleView.indicatorColor = kMainColor;
    self.titleView.titleNormalColor = kMain_TextColor;
    self.titleView.titleSelectColor = kMain_TextColor;
    self.titleView.titleFont= kFont(15);
    self.titleView.titleSelectFont = kFont(24);
    self.titleView.selectIndex = 0;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.titleView];
    
    self.pageContentView = [[FSPageContentView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeHeight  - SafeAreaTopHeight - SafeAreaBottom - 49) childVCs:@[[NewMessageVC new], [FriendMessageVC new]] parentVC:self delegate:self];
    self.pageContentView.contentViewCanScroll = YES;//设置滑动属性
    self.pageContentView.contentViewCurrentIndex = 0;
    [self.view addSubview:self.pageContentView];
    
    self.selectIndex = 0;

}

-(void)setSelectIndex:(int)selectIndex{
    _selectIndex = selectIndex;
    UIImage *image = selectIndex == 0 ? [UIImage new] : [UIImage loadImageWithName:@"message_friendsearch"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(questionAction)];
}
-(void)questionAction{
    
}

#pragma mark 选择器的delegate
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
    self.selectIndex = (int)endIndex;
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    self.selectIndex = (int)endIndex;
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
