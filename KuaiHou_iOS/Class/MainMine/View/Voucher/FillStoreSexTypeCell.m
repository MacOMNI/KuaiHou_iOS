//
//  FillStoreSexTypeCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FillStoreSexTypeCell.h"

@implementation FillStoreSexTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.currentIndex = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    self.manBtn.selected = currentIndex == 1;
    self.womanBtn.selected = currentIndex == 2;
    
    if (self.itemBlock) {
        self.itemBlock(currentIndex);
    }
}
- (IBAction)sexAction:(UIButton *)sender {
    self.currentIndex = sender.tag;
}

@end
