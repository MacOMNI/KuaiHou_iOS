//
//  StoreContentTextCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoreContentTextCell : BaseCell
@property (nonatomic, strong) NSString *content;
@property (weak, nonatomic) IBOutlet MLLabel *contentLab;

+(CGFloat )getHeightByContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
