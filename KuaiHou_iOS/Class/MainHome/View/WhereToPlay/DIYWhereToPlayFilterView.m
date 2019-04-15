//
//  DIYWhereToPlayFilterView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "DIYWhereToPlayFilterView.h"

@implementation DIYWhereToPlayFilterView


-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DIYWhereToPlayFilterView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth;
        self.height = 375;
        self.y = kScreenSizeHeight;
        self.centerX = [UIApplication sharedApplication].keyWindow.centerX;
        self.animateType = BOTTOM_ANIMATE;
        self.minValue = 0;
        self.maxValue = 10;
        
        //        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        self.typeCurrentIndex = 100;
        self.acCurrentIndex = 200;
        
        _slider = [[JLDoubleSlider alloc]initWithFrame:CGRectMake(15, 0, kScreenSizeWidth - 15 - 15, 40)];
        kWEAKSELF;
        _slider.minNum = 0;
        _slider.maxNum = 10;
        //    _slider.unit = @"￥";
//        _slider.minSlider.enabled = NO;
        _slider.minTintColor = kMain_TextColor_9;
        _slider.maxTintColor = kMain_TextColor_9;
        _slider.mainTintColor = kMainColor;
        [_slider setMaxValueBlock:^(CGFloat maxValue) {
            int maxV = maxValue;
            weakSelf.maxValue = maxV;
            //
        }];
        [_slider setMinValueBlock:^(CGFloat minValue) {
            weakSelf.minValue = minValue;
        }];
        
        
        [self.sliderView addSubview:_slider];
    }
    return self;
}
-(void)setMaxValue:(int)maxValue{
    _maxValue = maxValue;
    self.currentLab.text = [NSString stringWithFormat:@"（%d~%d）", self.minValue, maxValue];
}

-(void)setMinValue:(int)minValue{
    _minValue = minValue;
    self.currentLab.text = [NSString stringWithFormat:@"（%d~%d）", minValue, self.maxValue];
}


- (IBAction)typeAction:(UIButton *)sender {
    self.typeCurrentIndex = sender.tag;
}

- (IBAction)acAction:(UIButton *)sender {
    self.acCurrentIndex = sender.tag;
}
- (IBAction)commitAction:(UIButton *)sender {
    [self hiddenView];
}
- (IBAction)cancleAction:(UIButton *)sender {
    [self hiddenView];
}

-(void)setTypeCurrentIndex:(NSInteger)typeCurrentIndex{
    _typeCurrentIndex = typeCurrentIndex;
    
    if (typeCurrentIndex == self.type_item0.tag) {
        [MyTool fixCornerradius:self.type_item0 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.type_item0 setBackgroundColor:kMain_lineColor];
        [self.type_item0 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.type_item0 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.type_item0 setBackgroundColor:[UIColor clearColor]];
        [self.type_item0 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }
    if(typeCurrentIndex == self.type_item1.tag){
        [MyTool fixCornerradius:self.type_item1 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.type_item1 setBackgroundColor:kMain_lineColor];
        [self.type_item1 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.type_item1 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.type_item1 setBackgroundColor:[UIColor clearColor]];
        [self.type_item1 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }
    if(typeCurrentIndex == self.type_item2.tag){
        [MyTool fixCornerradius:self.type_item2 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.type_item2 setBackgroundColor:kMain_lineColor];
        [self.type_item2 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.type_item2 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.type_item2 setBackgroundColor:[UIColor clearColor]];
        [self.type_item2 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }
    if(typeCurrentIndex == self.type_item3.tag){
        [MyTool fixCornerradius:self.type_item3 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.type_item3 setBackgroundColor:kMain_lineColor];
        [self.type_item3 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.type_item3 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.type_item3 setBackgroundColor:[UIColor clearColor]];
        [self.type_item3 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }
    if(typeCurrentIndex == self.type_item4.tag){
        [MyTool fixCornerradius:self.type_item4 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.type_item4 setBackgroundColor:kMain_lineColor];
        [self.type_item4 setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    }else{
        [MyTool fixCornerradius:self.type_item4 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.type_item4 setBackgroundColor:[UIColor clearColor]];
        [self.type_item4 setTitleColor:kMain_TextColor_9 forState:(UIControlStateNormal)];
    }

}
-(void)setAcCurrentIndex:(NSInteger)acCurrentIndex{
    _acCurrentIndex = acCurrentIndex;
    
    
    if (acCurrentIndex == self.ac_item0.tag) {
        [MyTool fixCornerradius:self.ac_item0 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.ac_item0 setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.ac_item0 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.ac_item0 setBackgroundColor:[UIColor clearColor]];
    }
    if(acCurrentIndex == self.ac_item1.tag){
        [MyTool fixCornerradius:self.ac_item1 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.ac_item1 setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.ac_item1 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.ac_item1 setBackgroundColor:[UIColor clearColor]];
    }
    if(acCurrentIndex == self.ac_item2.tag){
        [MyTool fixCornerradius:self.ac_item2 cornerRadius:15 Color:kMain_lineColor_C Width:1];
        [self.ac_item2 setBackgroundColor:kMain_lineColor];
    }else{
        [MyTool fixCornerradius:self.ac_item2 cornerRadius:15 Color:[UIColor clearColor] Width:1];
        [self.ac_item2 setBackgroundColor:[UIColor clearColor]];
    }
}


@end
