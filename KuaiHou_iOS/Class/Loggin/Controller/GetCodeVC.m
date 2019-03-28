//
//  GetCodeVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "GetCodeVC.h"
#import "WGDigitField.h"
#import "FillInTheInfoVC.h"


@interface BackgroundWithBottomLine : UIView

@property (nonatomic, strong) UIView *bottomLine;

+ (instancetype)create;

@end


@implementation BackgroundWithBottomLine

+ (instancetype)create {
    BackgroundWithBottomLine *background = [[BackgroundWithBottomLine alloc] initWithFrame:CGRectMake(0, 0, 40, 45)];
    background.bottomLine = [[UIView alloc] init];
    background.bottomLine.backgroundColor = [UIColor grayColor];
    [background addSubview:background.bottomLine];
    [background.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.and.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
    return background;
}

@end




@interface GetCodeVC ()
@property (weak, nonatomic) IBOutlet UILabel *tipLab;

@property (nonatomic, strong) WGDigitField<WGDigitView<BackgroundWithBottomLine *> *> *field2;

@end

@implementation GetCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.field2 = [[WGDigitField<WGDigitView<BackgroundWithBottomLine *> *> alloc] initWithDigitViewInitBlock:^WGDigitView<BackgroundWithBottomLine *> * (NSInteger index){
        BackgroundWithBottomLine *background2 = [BackgroundWithBottomLine create];
        
        return [[WGDigitView<BackgroundWithBottomLine *> alloc] initWithBackgroundView:background2 digitFont:[UIFont systemFontOfSize:25.f] digitColor:[UIColor blackColor]];
    } numberOfDigits:6 leadSpacing:37.5 tailSpacing:37.5 weakenBlock:^(WGDigitView<BackgroundWithBottomLine *> * _Nonnull digitView) {
        digitView.backgroundView.bottomLine.backgroundColor = kMain_TextColor_9;
    } highlightedBlock:^(WGDigitView<BackgroundWithBottomLine *> * _Nonnull digitView) {
        digitView.backgroundView.bottomLine.backgroundColor = kMainColor;
    } fillCompleteBlock:^(WGDigitField * _Nonnull digitField, NSArray<WGDigitView<BackgroundWithBottomLine *> *> * _Nonnull digitViewArray, NSString * _Nonnull text) {
        for (WGDigitView<BackgroundWithBottomLine *> *digitView in digitViewArray) {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            animation.duration = 0.6;
            animation.values = @[@(-20.0), @20.0, @(-20.0), @20.0, @(-10.0), @10.0, @(-5.0), @(5.0), @(0.0)];
            [digitView.backgroundView.layer addAnimation:animation forKey:@"shake.animation"];
        }
        [digitField resignFirstResponder];
        
        NSLog(@"%@", text);
    }];
    
    [self.view addSubview:self.field2];
    
    [self.field2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.tipLab.mas_bottom).with.offset(20);
        make.height.equalTo(@(45 + 2 * 17));
    }];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.titleLabel.font = kFont(18);
    [button setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [button setBackgroundColor:kMain_lineColor];
    [MyTool fixCornerradius:button cornerRadius:22 Color:kMain_lineColor_C Width:0.5];
    [button addTarget:self action:@selector(commitAction) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitle:@"确定" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.field2.mas_left).offset(37.5);
        make.right.equalTo(self.field2.mas_right).offset(-37.5);
        make.height.mas_offset(@44);
        make.top.equalTo(self.field2.mas_bottom).offset(50);
    }];
}
-(void)commitAction{
    [self.navigationController pushViewController:[FillInTheInfoVC new] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
