//
//  MainVideoShowVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/4.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MainVideoShowVC.h"

@interface MainVideoShowVC ()
/**
 视频的播放器
 */
@property (nonatomic,strong)KSYMoviePlayerController *player;

@end

@implementation MainVideoShowVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.player pause];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    
    //创建播放器
    _player = [[KSYMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.videoPath]];
    [_player.view setFrame: self.view.bounds];  // player's frame must match parent's
    [self.view addSubview: _player.view];
    _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _player.view.frame = CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeHeight);
    _player.shouldAutoplay = YES;
    [_player setShouldLoop:YES];
    _player.scalingMode = MPMovieScalingModeAspectFit;
    self.player.view.backgroundColor = [UIColor blackColor];
    
    [_player setBufferSizeMax:1];
    
    [_player setShouldAutoplay:true];
    [_player setShouldLoop:YES];
    [_player prepareToPlay];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame =CGRectMake(15, 35, 24, 45);
    [button setImage:GKImage(@"btn_back_white") forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    [self.view bringSubviewToFront:button];
    
    UIButton *moreButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    moreButton.frame =CGRectMake(kScreenSizeWidth - 30 - 15, 35, 24, 45);
    [moreButton setImage:[UIImage loadImageWithName:@"more_white"] forState:(UIControlStateNormal)];
    [moreButton addTarget:self action:@selector(moreAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:moreButton];
    [self.view bringSubviewToFront:moreButton];
    
    

}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)moreAction{
    
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
