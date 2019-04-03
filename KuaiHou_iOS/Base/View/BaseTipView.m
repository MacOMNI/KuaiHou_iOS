//
//  BaseTipView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseTipView.h"

@interface BaseTipView ()

@end

@implementation BaseTipView



-(void)showView{
    _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0.0;
    
    [[UIApplication sharedApplication].keyWindow addSubview:_maskView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    if (self.animateType == BOTTOM_ANIMATE) {
        [self BottomShow];
    }else{
        [self ZoomShow];
    }
    
    
}

-(void)hiddenView{
    if (self.animateType == BOTTOM_ANIMATE) {
        [self BottomHidden];
    }else{
        [self ZoomHidden];
    }
}

-(void)setAnimateType:(AnimateType)animateType{
    _animateType = animateType;
}


-(void)ZoomShow{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.maskView.alpha = 0.4;
                         self.transform = CGAffineTransformMakeScale(1.1, 1.1);
                     }
                     completion:^(BOOL finished){
                         
                         
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                              self.transform = CGAffineTransformMakeScale(0.9, 0.9);
                                          }
                                          completion:^(BOOL finished){
                                              [UIView animateWithDuration:0.3
                                                               animations:^{
                                                                   self.transform = CGAffineTransformMakeScale(1, 1);
                                                               }
                                                               completion:^(BOOL finished){
                                                                   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
                                                                   [self.maskView addGestureRecognizer:tap];
                                                               }];
                                          }];
                     }];
}

-(void)ZoomHidden{
    if (_maskView) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.transform = CGAffineTransformMakeScale(0.05, 0.05);
                         }
                         completion:^(BOOL finished){
                             
                             [self removeFromSuperview];
                             [self.maskView removeFromSuperview];
                             self->_maskView = nil;
                         }];
    }
}


-(void)BottomShow{
    [UIView animateWithDuration:0.3 animations:^{
        self.maskView.alpha = 0.4;
        CGRect newFrame = self.frame;
        newFrame.origin.y = kScreenSizeHeight - self.frame.size.height - SafeAreaBottom;
        self.frame = newFrame;
        
    } completion:^(BOOL finished) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
        [self.maskView addGestureRecognizer:tap];
    }];
}

-(void)BottomHidden{
    if (_maskView) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             CGRect newFrame = self.frame;
                             newFrame.origin.y = kScreenSizeHeight;
                             self.frame = newFrame;
                         }
                         completion:^(BOOL finished){
                             
                             [self removeFromSuperview];
                             [self->_maskView removeFromSuperview];
                             self->_maskView = nil;
                         }];
    }
}



@end
