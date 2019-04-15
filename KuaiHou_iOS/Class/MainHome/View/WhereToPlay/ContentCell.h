//
//  ContentCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentCell : BaseCell
@property (weak, nonatomic) IBOutlet MLLabel *contentLab;

@property (nonatomic, strong) NSString *content;

+(CGFloat)getHeightByContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
