//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import "PLEmptyViewFactory.h"
@implementation PLEmptyViewFactory
+ (void)errorNetwork:(UIScrollView *)scrollView btnBlock:(void (^)(void))btnBlock
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"网络异常";
      //  config.emptySubtitle = @"网络连接超时，请重试!";
        config.emptyBtnHeight = 30.5;
        config.emptyBtnWidth = 115;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (void)errorNetwork:(UIScrollView *)scrollView topMargin:(CGFloat)topMargin btnBlock:(void (^)(void))btnBlock
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"网络异常";
       // config.emptySubtitle = @"网络连接超时，请重试!";
        config.emptyBtnHeight = 30.5;
        config.emptyBtnWidth = 115;
        config.emptyImageTopMargin = config.emptyImageTopMargin-topMargin;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (void)errorData:(UIScrollView *)scrollView btnBlock:(void (^)(void))btnBlock
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"接口数据返回异常";
       // config.emptySubtitle = @"数据请求异常，请重试!";
        config.emptyBtnHeight = 30.5;
        config.emptyBtnWidth = 115;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (void)errorData:(UIScrollView *)scrollView topMargin:(CGFloat)topMargin btnBlock:(void (^)(void))btnBlock
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"接口数据返回异常";
       // config.emptySubtitle = @"数据请求异常，请重试!";
        config.emptyBtnHeight = 30.5;
        config.emptyBtnWidth = 100;
        config.emptyImageTopMargin = config.emptyImageTopMargin-topMargin;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (void)emptyNoDataView:(UIScrollView *)scrollView btnBlock:(void (^)(void))btnBlock
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView
                                        configBlock:^(PLEmptyConfig *config) {
                                            config.emptyImage = [UIImage imageNamed:@"common_no_content"];
                                            config.emptyTitle = @"当前没有相关记录哦";
                                            config.emptySubtitle = @"请点击发出请求\n有一定的概率可以加载出新数据\n赶快试一试吧";
                                            config.emptyBtnHeight = 30.5;
                                            config.emptyBtnWidth = 115;
                                        }
                                        emptyBtnTitle:@"发出请求"
                                  emptyBtnActionBlock:btnBlock];
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}
+ (void)emptyNoDataView:(UIScrollView *)scrollView
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    config.emptyImage = [UIImage imageNamed:@"icon_no_data"];
    config.emptyTitle = @"当前没有相关记录哦";
    [PLScrollViewEmptyView emptyWithContentView:scrollView emptyConfig:config];
    
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }

}

+ (void)emptyNoDataView:(UIScrollView *)scrollView title:(NSString *)title
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    config.emptyImage = [UIImage imageNamed:@"app2_common_no_content"];
    config.emptyTitle = title;
    //   config.emptySubtitle = @"可以在试试下拉刷新获取数据\n有一定的概率可以加载出之前的数据\n赶快试一试吧";
    [PLScrollViewEmptyView emptyWithContentView:scrollView emptyConfig:config];
    
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
    //self.emptyImageTopMargin
}
+ (void)emptyNoDataView:(UIScrollView *)scrollView title:(NSString *)title topMargin:(CGFloat)topMargin
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    config.emptyImage = [UIImage imageNamed:@"app2_common_no_content"];
    config.emptyTitle = title;
    config.emptyImageTopMargin = config.emptyImageTopMargin-topMargin;
    //   config.emptySubtitle = @"可以在试试下拉刷新获取数据\n有一定的概率可以加载出之前的数据\n赶快试一试吧";
    [PLScrollViewEmptyView emptyWithContentView:scrollView emptyConfig:config];
    
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }

}
+ (void)emptyNoDataView:(UIScrollView *)scrollView title:(NSString *)title btnTitle:(NSString *)btnTile
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    config.emptyImage = [UIImage imageNamed:@"app2_common_no_content"];
    config.emptyTitle = title;
    
    //   config.emptySubtitle = @"可以在试试下拉刷新获取数据\n有一定的概率可以加载出之前的数据\n赶快试一试吧";
    [PLScrollViewEmptyView emptyWithContentView:scrollView emptyConfig:config];
    
    if ([scrollView  isKindOfClass:[UITableView class]]) {
        [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (void)emptyNoDataView:(UIScrollView *)scrollView config:(PLEmptyConfig *)config
{
    [PLScrollViewEmptyView emptyWithContentView:scrollView emptyConfig:config];
    if (config.emptyImage == nil) {
         config.emptyImage = [UIImage imageNamed:@"app2_common_no_content"];
    }
    if ([scrollView  isKindOfClass:[UITableView class]]) {
         [(UITableView *)scrollView reloadData];
    }else  if ([scrollView  isKindOfClass:[UICollectionView class]]) {
        [( UICollectionView *)scrollView reloadData];
    }
}

+ (PLEmptyView *)errorNetworkWithView:(UIView *)view  btnBlock:(void (^)(void))btnBlock
{
    return [PLEmptyViewFactory errorNetworkWithView:view topOffset:0 btnBlock:btnBlock];
}

+ (PLEmptyView *)errorNetworkWithView:(UIView *)view topOffset:(CGFloat)topOffset btnBlock:(void (^)(void))btnBlock
{
  PLEmptyView* emptyView = [PLEmptyView emptyWithHeight:kScreenSizeHeight configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"页面丢掉了,请重试或检查网络";
       // config.emptySubtitle = @"网络连接超时，请重试!";
        config.emptyBtnHeight = 30.5;
        config.emptyBtnWidth = 100;
      config.emptyImageSize = CGSizeMake(180, 120);
      config.emptyImageTopMargin = ((kScreenSizeHeight+view.y-SafeAreaTopHeight)/2-170)+topOffset;
      config.emptyTitleTopMargin = 20;
  //      config.emptyImageTopMargin = 10;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
   // emptyView.center = CGPointMake(emptyView.center.x,view.bounds.size.height/2);
    emptyView.indexType = PLEmptyViewTypeErrorNetWork;
    [view addSubview:emptyView];
    return emptyView;
}

+(PLEmptyView *)errorDataWithView:(UIView *)view btnBlock:(void (^)(void))btnBlock
{
    
    PLEmptyView* emptyView = [PLEmptyView emptyWithHeight:kScreenSizeHeight configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:@"icon_error_network"];
        config.emptyTitle = @"网络好像断了 刷新试试吧";
  //      config.emptySubtitle = @"数据请求异常，请重试!";
        config.emptyBtnHeight = 30;
        config.emptyBtnWidth = 90;
        config.emptyBtnBgColor = [UIColor blackColor];
        config.emptyBtnTileColor = [UIColor whiteColor];
        config.emptyBtnTitleFont = kFont(15);
        config.emptyImageSize = CGSizeMake(248.5, 118);
//        config.emptyImageTopMargin = (kScreenSizeHeight+view.y-SafeAreaTopHeight)/2-170;
        config.emptyImageTopMargin = view.height / 2.0 - 150;
        config.emptyTitleTopMargin = 20;
    } emptyBtnTitle:@"刷新" emptyBtnActionBlock:btnBlock];
    emptyView.indexType = PLEmptyViewTypeErrorData;
  //  emptyView.center = CGPointMake(emptyView.center.x,view.bounds.size.height/2);
    [view addSubview:emptyView];
    return emptyView;
}


+ (PLEmptyView *)emptyNoDataViewWithView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName
{
    return [PLEmptyViewFactory emptyNoDataViewWithView:view title:title imageName:imageName topOffset:0];
}
+ (PLEmptyView *)emptyNoDataViewWithView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName topOffset:(CGFloat)topOffset
{
    PLEmptyView* emptyView = [PLEmptyView emptyWithHeight:kScreenSizeHeight configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [UIImage imageNamed:[MyTool isBlankString:imageName]?@"icon_no_data":imageName];
        config.emptyTitle = ([MyTool isBlankString:title]?@"这里面空空的哦":title);
        config.emptyImageSize = CGSizeMake(233.5, 143);
        NSLog(@"%f", view.centerY );
        config.emptyImageTopMargin = view.height / 2.0 - 150;
//        config.emptyImageTopMargin = 40;
        config.emptyTitleTopMargin = 20;
    }];
    emptyView.indexType = PLEmptyViewTypeNoData;
    [view addSubview:emptyView];
    return emptyView;
}
+ (PLEmptyView *)emptyLodingDataViewWithView:(UIView *)view
{
    return [PLEmptyViewFactory emptyLodingDataViewWithView:view topOffset:0];
}

+ (PLEmptyView *)emptyLodingDataViewWithView:(UIView *)view topOffset:(CGFloat)topOffset
{
    PLEmptyView* emptyView = [PLEmptyView emptyWithHeight:kScreenSizeHeight configBlock:^(PLEmptyConfig *config) {
        config.emptyImage = [PLEmptyViewFactory imageWithTrends];
        config.emptyImageSize = CGSizeMake(130, 130);// KNavgationinset
        if (kScreenSizeHeight+view.y) {
            
        }
        config.emptyImageTopMargin =((kScreenSizeHeight+view.y-SafeAreaTopHeight)/2-170)+topOffset;
        config.emptyTitleTopMargin = 20;
        config.emptyTitle = @"正在加载中,请稍后...";
        
    }];
   // emptyView.centerY = view.centerY;
    emptyView.indexType = PLEmptyViewTypeNoData;
    emptyView.backgroundColor = [UIColor clearColor];
    [view addSubview:emptyView];
    [view bringSubviewToFront:emptyView];
    return emptyView;
}

+ (UIImage *)imageWithTrends
{
    
    UIImage *animatedImage;
    NSMutableArray *images = [NSMutableArray array];
    NSTimeInterval duration = 0.0f;
    for (NSInteger i = 0; i<11; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"icon_loding_hud_Img%d",(int)i+1]];
        [images addObject:img];
    }
    // 设置动画时长
    if (!duration) {
        duration = (1.0f / 10.0f) * images.count;
    }
    animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    return animatedImage;
}
@end
