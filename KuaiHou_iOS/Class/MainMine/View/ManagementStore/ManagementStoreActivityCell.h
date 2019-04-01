//
//  ManagementStoreActivityCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/29.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagementStoreActivityCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;

@property (weak, nonatomic) IBOutlet UIView *lineView;
+(CGFloat)getHeightByContent:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
