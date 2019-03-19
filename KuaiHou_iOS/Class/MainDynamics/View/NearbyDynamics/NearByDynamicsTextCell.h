//
//  NearByDynamicsTextCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/18.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NearByDynamicsTextCell : BaseCell

// 是否展开
@property (nonatomic , copy) void(^openBlock)(void);

-(void)setDataWithContent:(NSString *)content userId:(NSNumber *)userId isForwarding:(BOOL)forwarding isOpen:(BOOL)isOpen;

+(CGFloat)cellHeightWithContent:(NSString *)content isOpen:(BOOL)isOpen;
+(CGFloat)cellHeightWithContent:(NSString *)content WithFont:(CGFloat)font isOpen:(BOOL)isOpen;

@end

NS_ASSUME_NONNULL_END
