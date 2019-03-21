//
//  MainDynamicsVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainDynamicsVC.h"
#import "FSScrollContentView.h"
#import "NearbyDynamicsVC.h"
#import "FavorableDynamicsVC.h"
#import "HeedDynamicsVC.h"
#import "SendDynamicsVC.h"

@interface MainDynamicsVC ()<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>

@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;

@property (nonatomic, strong) UILabel *messageTipLab;

@end

@implementation MainDynamicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
    [self createRightSendItem];
    
}

-(void)fixUI{
    NSArray *items = @[@"附近", @"特惠", @"关注"];
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(15, 25, 200, 40) titles:items delegate:self indicatorType:FSIndicatorTypeDIY];
    self.titleView.indicatorExtension = 15;
//    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.indicatorColor = kMainColor;
    self.titleView.titleNormalColor = kMain_TextColor;
    self.titleView.titleSelectColor = kMain_TextColor;
    self.titleView.titleFont= kFont(15);
    self.titleView.titleSelectFont = kFont(24);
    self.titleView.selectIndex = 0;
    [self.view addSubview:self.titleView];
    
    UIButton *filterBtn = [[UIButton alloc] init];
    [filterBtn setImage:[UIImage loadImageWithName:@"dynamics_filter"] forState:(UIControlStateNormal)];
    [filterBtn addTarget:self action:@selector(filterAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:filterBtn];
    
    [filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@(-15));
        make.centerY.mas_equalTo(self.titleView.mas_centerY);
    }];
    
    self.pageContentView = [[FSPageContentView alloc] initWithFrame:CGRectMake(0, 70, kScreenSizeWidth, kScreenSizeHeight - 70 - SafeAreaTopHeight - SafeAreaBottom - 49) childVCs:@[[NearbyDynamicsVC new], [FavorableDynamicsVC new], [HeedDynamicsVC new]] parentVC:self delegate:self];
    self.pageContentView.contentViewCanScroll = YES;//设置滑动属性
    self.pageContentView.contentViewCurrentIndex = 0;
    [self.view addSubview:self.pageContentView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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


#pragma mark 选择器的delegate
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
}

-(void)messageAction{
    
}

-(void)filterAction{
    
}

-(void)sendAction{
    SendDynamicsVC *send = [SendDynamicsVC new];
    [self.navigationController pushViewController:send animated:YES];
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
