//
//  DIYFilterView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/3.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYFilterView.h"



@implementation DIYFilterView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYFilterView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth;
        self.height = 250;
        self.y = kScreenSizeHeight;
        self.centerX = [UIApplication sharedApplication].keyWindow.centerX;
        self.animateType = BOTTOM_ANIMATE;
        
//        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        self.currentIndex = 0;
        
    }
    return self;
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    if (currentIndex == self.allBtn.tag) {
        [MyTool fixCornerradius:self.allBtn cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.allBtn setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.allBtn cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.allBtn setBackgroundColor:[UIColor clearColor]];
    }
    
    if (currentIndex == self.womanBtn.tag) {
        [MyTool fixCornerradius:self.womanBtn cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.womanBtn setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.womanBtn cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.womanBtn setBackgroundColor:[UIColor clearColor]];
    }
    
    if (currentIndex == self.manBtn.tag) {
        [MyTool fixCornerradius:self.manBtn cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.manBtn setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.manBtn cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.manBtn setBackgroundColor:[UIColor clearColor]];
    }
}
- (IBAction)itemAction:(UIButton *)sender {
    self.currentIndex = sender.tag;
}
- (IBAction)commitAction:(UIButton *)sender {
    if (self.commitBlock) {
        self.commitBlock(sender.tag);
    }
    [self hiddenView];
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}

@end
