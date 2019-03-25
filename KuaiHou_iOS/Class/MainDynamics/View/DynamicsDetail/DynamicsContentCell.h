//
//  DynamicsContentCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"
#import <MLLinkLabel.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicsContentCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet MLLinkLabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

-(void)setContent:(NSString *)content userId:(NSString *)userId ToUserName:(NSString *)userName;

+(CGFloat)getHeightByContent:(NSString *)content userName:(NSString *)userName;

@end

NS_ASSUME_NONNULL_END
