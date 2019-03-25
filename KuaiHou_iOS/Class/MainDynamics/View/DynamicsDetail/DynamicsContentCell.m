//
//  DynamicsContentCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/25.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DynamicsContentCell.h"

@implementation DynamicsContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setContent:(NSString *)content userId:(NSString *)userId ToUserName:(NSString *)userName{
    NSString *newContentStr = nil;
    self.contentLab.lineHeightMultiple = 1.2;
    self.contentLab.dataDetectorTypes = MLDataDetectorTypeAttributedLink;
    self.contentLab.allowLineBreakInsideLinks = NO;
    self.contentLab.linkTextAttributes = @{NSForegroundColorAttributeName:kMainColor};
    self.contentLab.numberOfLines = 0;
    self.contentLab.font = kFont(15);
    self.contentLab.textColor = kMain_TextColor;
    
    if (userName.length == 0) {
        newContentStr = content;
        self.contentLab.text = content;
    }else{
        newContentStr = [NSString stringWithFormat:@"@%@：%@", userName, content];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:newContentStr];
        [attrStr addAttribute:NSLinkAttributeName value:userId range:NSMakeRange(0, userName.length + 1)];
        self.contentLab.attributedText = attrStr;
        [self.contentLab invalidateDisplayForLinks];
        [self.contentLab setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
            NSString *tips = [NSString stringWithFormat:@"Click\nlinkType:%ld\nlinkText:%@\nlinkValue:%@",link.linkType,linkText,link.linkValue];
            NSLog(@"%@", tips);
        }];
    }
    self.contentLab.width = kScreenSizeWidth - 85;
    [self.contentLab sizeToFit];
//    self.contentLab.activeLinkTextAttributes = @{NSForegroundColorAttributeName:kMainColor,NSBackgroundColorAttributeName:[UIColor blueColor]};
    
    
}

+(CGFloat)getHeightByContent:(NSString *)content userName:(NSString *)userName{
    MLLinkLabel *label = [[MLLinkLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth - 85, 100)];
    label.lineHeightMultiple = 1.2;
    label.allowLineBreakInsideLinks = NO;
    label.dataDetectorTypes = MLDataDetectorTypeAttributedLink;
    label.font = kFont(15);
    NSString *newContentStr = nil;
    label.numberOfLines = 0;
    if (userName.length == 0) {
        newContentStr = content;
         label.text = content;
    }else{
        newContentStr = [NSString stringWithFormat:@"@%@：%@", userName, content];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:newContentStr];
        label.attributedText = attrStr;
    }
    
    label.width = kScreenSizeWidth - 85;
    [label sizeToFit];
    return label.height + 75;
}

@end
