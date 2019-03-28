//
//  OpenStoreTextViewCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenStoreTextViewCell.h"

@interface OpenStoreTextViewCell () <UITextViewDelegate>

@end


@implementation OpenStoreTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.textView.xx_placeholder = @"请输入店铺简介";
    self.textView.xx_placeholderColor = kMain_TextColor_9;
    self.textView.xx_placeholderFont = kFont(12);
    self.textView.delegate = self;
    
}

- (void)textViewDidChange:(UITextView *)textView{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    if (selectedRange && pos) {
        return;
    }
    NSUInteger count = textView.text.length;
    
    if (count>=100) {
        self.wordNum.text = @"100/100";
        textView.text = [textView.text substringToIndex:100];
    }else{
        self.wordNum.text = [NSString stringWithFormat:@"%ld/200", (unsigned long)count];
    }
    
    if (self.changeTextField) {
        self.changeTextField(textView);
    }


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
