//
//  FillStoreItemCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/9.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "FillStoreItemCell.h"

@implementation FillStoreItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.currentIndex = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)itmeAction:(UIButton *)sender {
    self.currentIndex = sender.tag;
    
    
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    if (currentIndex == self.itme0.tag) {
        [MyTool fixCornerradius:self.itme0 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.itme0 setBackgroundColor:kMain_lineColor];
        [self.itme0 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.itme0 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.itme0 setBackgroundColor:[UIColor clearColor]];
        [self.itme0 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }

    if (currentIndex == self.itme1.tag) {
        [MyTool fixCornerradius:self.itme1 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.itme1 setBackgroundColor:kMain_lineColor];
        [self.itme1 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.itme1 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.itme1 setBackgroundColor:[UIColor clearColor]];
        [self.itme1 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }

    if (currentIndex == self.itme2.tag) {
        [MyTool fixCornerradius:self.itme2 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.itme2 setBackgroundColor:kMain_lineColor];
        [self.itme2 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.itme2 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.itme2 setBackgroundColor:[UIColor clearColor]];
        [self.itme2 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }

    if (currentIndex == self.itme3.tag) {
        [MyTool fixCornerradius:self.itme3 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.itme3 setBackgroundColor:kMain_lineColor];
        [self.itme3 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.itme3 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.itme3 setBackgroundColor:[UIColor clearColor]];
        [self.itme3 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }
    
    if (self.selItemBlock) {
        self.selItemBlock(currentIndex);
    }
}


@end
