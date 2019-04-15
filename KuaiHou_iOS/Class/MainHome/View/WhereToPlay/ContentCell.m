//
//  ContentCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setContent:(NSString *)content{
    self.contentLab.lineHeightMultiple = 1.2;
    self.contentLab.numberOfLines = 0;
    self.contentLab.font = kFont(12);
    self.contentLab.textColor = kMain_TextColor;
    self.contentLab.text = content;
    self.contentLab.width = kScreenSizeWidth - 30;
    [self.contentLab sizeToFit];
}
+(CGFloat)getHeightByContent:(NSString *)content{
    MLLabel *label = [[MLLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth - 30, 100)];
    label.lineHeightMultiple = 1.2;
    label.numberOfLines = 0;
    label.font = kFont(12);
    label.text = content;
    label.width = kScreenSizeWidth - 30;
    [label sizeToFit];
    return label.height;
}

@end
