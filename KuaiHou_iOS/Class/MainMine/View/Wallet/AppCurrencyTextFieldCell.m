//
//  AppCurrencyTextFieldCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/11.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "AppCurrencyTextFieldCell.h"

@implementation AppCurrencyTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField.placeholderDIYColor = kMain_TextColor_9;
    
    [_textField addTarget:self action:@selector(actionToValueChange:) forControlEvents:UIControlEventEditingChanged];
}


-(void)actionToValueChange:(UITextField *)textField
{
    if (textField.text.length == 0) {
        self.titleLab.text = @"0个";
    }else{
        self.titleLab.text = [NSString stringWithFormat:@"%@个", textField.text];
    }
    if (self.valueChangeBlock) {
        self.valueChangeBlock(textField);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
