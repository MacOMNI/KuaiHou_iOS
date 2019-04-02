//
//  StartContentView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/2.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "StartContentView.h"
#import "GZHRatingView.h"

@interface StartContentView () <ratingViewDelegate>

@property (nonatomic, strong)GZHRatingView *oneStartView;
@property (nonatomic, strong)GZHRatingView *twoStartView;
@property (nonatomic, strong)GZHRatingView *threeStartView;

@property (nonatomic, assign) NSInteger oneScore;
@property (nonatomic, assign) NSInteger twoScore;
@property (nonatomic, assign) NSInteger threeScore;

@end

@implementation StartContentView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"StartContentView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 250;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        [self fixUI];
        
    }
    return self;
}

-(void)fixUI{
    
    self.oneScore = 5;
    self.twoScore = 5;
    self.threeScore = 5;
    
    CGFloat width = [MyTool getWidthWithTitle:@"服务态度" font:15] + 55;
    self.oneStartView = [[GZHRatingView alloc] initWithFrame:CGRectMake(width + 15, self.title_one.y, 150, 15) widDistance:5];
    self.oneStartView.score = self.oneScore;
    self.oneStartView.ratingType = INTEGER_TYPE;
    self.oneStartView.delegate = self;
    self.oneStartView.tag = 0;
    [self addSubview:self.oneStartView];
    
    self.twoStartView = [[GZHRatingView alloc] initWithFrame:CGRectMake(width + 15, self.title_two.y, 150, 15) widDistance:5];
    self.twoStartView.score = self.twoScore;
    self.twoStartView.ratingType = INTEGER_TYPE;
    self.twoStartView.delegate = self;
    self.twoStartView.tag = 1;
    [self addSubview:self.twoStartView];
    
    self.threeStartView = [[GZHRatingView alloc] initWithFrame:CGRectMake(width + 15, self.title_three.y, 150, 15) widDistance:5];
    self.threeStartView.score = self.threeScore;
    self.threeStartView.ratingType = INTEGER_TYPE;
    self.threeStartView.delegate = self;
    self.threeStartView.tag = 2;
    [self addSubview:self.threeStartView];
}

- (void)ratingView:(GZHRatingView *)view score:(CGFloat)score{
    if (view.tag == 0) {
        self.oneScore = score;
    }
    if (view.tag == 1) {
        self.twoScore = score;
    }
    if (view.tag == 2) {
        self.threeScore = score;
    }
}
- (IBAction)cancleAction:(id)sender {
    [self hiddenView];
}
- (IBAction)commitAction:(id)sender {
    NSLog(@"%ld, %ld, %ld", self.oneScore, self.twoScore, self.threeScore);
}

@end
