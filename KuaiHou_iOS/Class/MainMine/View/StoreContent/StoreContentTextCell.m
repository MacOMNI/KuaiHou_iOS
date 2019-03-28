//
//  StoreContentTextCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StoreContentTextCell.h"

@implementation StoreContentTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setContent:(NSString *)content{
    _content = content;
    self.contentLab.lineHeightMultiple = 1.2;
    self.contentLab.numberOfLines = 0;
    self.contentLab.font = kFont(15);
    self.contentLab.textColor = kMain_TextColor;
    self.contentLab.text = content;
    self.contentLab.width = kScreenSizeWidth - 74 - 15;
    [self.contentLab sizeToFit];
    
}

+(CGFloat )getHeightByContent:(NSString *)content{
    MLLabel *label = [MLLabel new];
    label.lineHeightMultiple = 1.2;
    label.numberOfLines = 0;
    label.font = kFont(15);
    label.text = content;
    label.width = kScreenSizeWidth - 74 - 15;
    [label sizeToFit];
    return label.height;
}

@end
