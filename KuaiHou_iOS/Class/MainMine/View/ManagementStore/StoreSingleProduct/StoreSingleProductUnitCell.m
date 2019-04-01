//
//  StoreSingleProductUnitCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StoreSingleProductUnitCell.h"

@implementation StoreSingleProductUnitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    CAShapeLayer *border = [CAShapeLayer layer];
    //虚线的颜色
    border.strokeColor = kMain_TextColor_9.CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.unitTextField.bounds cornerRadius:2.5];
    //设置路径
    border.path = path.CGPath;
    border.frame = self.unitTextField.bounds;
    //虚线的宽度
    border.lineWidth = .5f;
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    self.unitTextField.layer.cornerRadius = 2.5f;
    self.unitTextField.layer.masksToBounds = YES;
    
    [self.unitTextField.layer addSublayer:border];
    
    [_unitTextField addTarget:self action:@selector(actionToValueChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)itemAction:(UIButton *)sender {
    self.currentIndex = sender.tag;
    self.unitTextField.text = nil;
    [self endEditing:YES];
    if (self.valueChangeBlock) {
        self.valueChangeBlock(self.unitTextField);
    }
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    self.item0.selected = self.item0.tag == currentIndex;
    self.item1.selected = self.item1.tag == currentIndex;
    self.item2.selected = self.item2.tag == currentIndex;
    self.item3.selected = self.item3.tag == currentIndex;
    self.item4.selected = self.item4.tag == currentIndex;
    self.item5.selected = self.item5.tag == currentIndex;
    self.item6.selected = self.item6.tag == currentIndex;
}

-(void)actionToValueChange:(UITextField *)textField
{
    if (self.valueChangeBlock) {
        self.valueChangeBlock(textField);
    }
}

@end
