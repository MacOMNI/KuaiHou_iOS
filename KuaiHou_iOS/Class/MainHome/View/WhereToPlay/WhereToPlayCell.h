//
//  WhereToPlayCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/12.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WhereToPlayCell : BaseCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *carBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *itemLab0;
@property (weak, nonatomic) IBOutlet UILabel *itemLab1;
@property (weak, nonatomic) IBOutlet UILabel *itemLab2;
@property (weak, nonatomic) IBOutlet UILabel *itemLab3;
@property (weak, nonatomic) IBOutlet UIButton *distanceLab;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;


@end

NS_ASSUME_NONNULL_END
