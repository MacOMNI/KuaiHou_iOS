//
//  ManagementStoreConfigCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagementStoreConfigCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UILabel *detaildLab;
@property (weak, nonatomic) IBOutlet UILabel *discountLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

-(void)configByImageName:(NSString *)imageStr title:(NSString *)title detail:(NSString *)detail discount:(NSString *)discount price:(NSString *)price;

@end

NS_ASSUME_NONNULL_END
