//
//  DIYReportView.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DIYReportView : BaseTipView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) NSInteger currentIndex;

@end

NS_ASSUME_NONNULL_END
