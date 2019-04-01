//
//  ManagementStoreTextViewCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagementStoreTextViewCell.h"

@implementation ManagementStoreTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textView.xx_placeholderFont = kFont(12);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textViewDidChange:(UITextView *)textView{
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    if (selectedRange && pos) {
        return;
    }
    NSUInteger count = textView.text.length;
    
    if (count>=120) {
        textView.text = [textView.text substringToIndex:120];
    }else{
    }
    
    if (self.changeTextField) {
        self.changeTextField(textView);
    }
    
    
}


@end
