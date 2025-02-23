//
//  VideoRecordManager.m
//  Zing
//
//  Created by 胡广宇 on 2017/3/29.
//  Copyright © 2017年 Witgo. All rights reserved.
//

#import "VideoRecordManager.h"
#import <AVFoundation/AVFoundation.h>
#import "VideoFileManager.h"
#import "ShortVideoRecorder.h"
#import "ShortVideoSession.h"

//static CGFloat VideoRecordMaxTime = 15; //视频最大时长 (单位/秒)
//static CGFloat VideoRecordMinTime = 3;  //最短视频时长 (单位/秒)
//static CGFloat TimeInterval = 0.05;  //定时器请求间隔

@interface VideoRecordManager ()<ShortVideoRecorderDelegate>
/** 父视图 */
@property (nonatomic, strong) UIView *superView;
/** 视频播放器 */
@property (nonatomic, strong) AVPlayer *videoPlayer;
/** 视频播放图层 */
@property (nonatomic, strong) AVPlayerLayer *videoPlayerLayer;
/** 文件管理类 */
@property (nonatomic, strong) VideoFileManager *videoFileManager;
/** 主要录制工具 */
@property (nonatomic, strong) ShortVideoRecorder *recorder;
/** 记录录制时间定时器 */
@property (nonatomic, strong) NSTimer* timer;
/** 记录录制时间 */
@property (nonatomic, assign) CGFloat recordingTime;

@end

@implementation VideoRecordManager

- (void)dealloc{
    NSLog(@"VideoRecordManager dealloc ");
    self.videoPlayer = nil;
    self.videoPlayerLayer = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

-(void)setVideoRecordMaxTime:(CGFloat)VideoRecordMaxTime{
    _VideoRecordMaxTime = VideoRecordMaxTime;
}

-(void)setVideoRecordMinTime:(CGFloat)VideoRecordMinTime{
    _VideoRecordMinTime = VideoRecordMinTime;
}

-(void)setTimeInterval:(CGFloat)TimeInterval{
    _TimeInterval = TimeInterval;
}

/**
 初始化
 
 @param superView 父视图
 @return self
 */
- (instancetype)initWithSuperView:(UIView *)superView{
    
    if (self = [super init]) {
        self.VideoRecordMaxTime = 15;
        self.VideoRecordMinTime = 2;
        self.TimeInterval = 0.5;
        //保存父视图对象
        self.superView = superView;
        //创建文件路径
        self.videoFileManager = [[VideoFileManager alloc] init];
        [self.videoFileManager createNewVideoPath];
        //创建视频录制对象
        self.recorder = [[ShortVideoRecorder alloc] initWithOutputFilePath:self.videoFileManager.currentVideoPath outputSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        //通过代理回调
        self.recorder.delegate = self;
        //注册通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(videoPlayerDidPlayEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        
        
    }
    return self;
}

/**
 开启摄像
 */
- (void)openVideo{
    //录制时需要获取预览显示的layer，根据情况设置layer属性，显示在自定义的界面上
    [self.recorder previewLayer].videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.recorder previewLayer].frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    if (![self.recorder previewLayer].superlayer) {
        [self.superView.layer insertSublayer:[self.recorder previewLayer] atIndex:0];
    }
    [self.recorder startRunning];
}

/**
 关闭摄像
 */
- (void)closeVideo{
    [self.recorder stopRunning];
}


/**
 开始录像
 */
- (void)startVideoRecord{
    //禁止自动锁屏
    [self startTimer];
    [UIApplication sharedApplication].idleTimerDisabled = true;
    [self.recorder startRecording];
}

/**
 停止录像
 */
- (void)stopVideoRecord{
    [self timerStop];
    //解除禁止自动锁屏
    [UIApplication sharedApplication].idleTimerDisabled = false;
    [self.recorder stopRecording];
    if (self.recordingTime < self.VideoRecordMinTime) {
        if ([self.delegate respondsToSelector:@selector(recordTimerTooShort:)]) {
            [self.delegate recordTimerTooShort:self];
        }
    }else{
        [self closeVideo];
        [self playVideoWithPath:[NSURL fileURLWithPath:self.videoFileManager.currentVideoPath]];
    }
}

/**
 移除录像
 */
- (void)deleteVideoRecord{
    [self.videoPlayer pause];
    [self.videoPlayerLayer removeFromSuperlayer];
    self.videoPlayer = nil;
    self.videoPlayerLayer = nil;
    [self openVideo];
    [self.videoFileManager deleteVideoFile];
    [self.videoFileManager createNewVideoPath];
    [self.recorder refreshNewFilePath:self.videoFileManager.currentVideoPath];
}

/**
 视频播放结束,重新播放
 
 @param notification 通知
 */
- (void)videoPlayerDidPlayEnd:(NSNotification *)notification{
    __weak typeof(self)weakSelf = self;
    [self.videoPlayer seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
        [weakSelf.videoPlayer play];
    }];
}


/**
 播放视频
 
 @param url 视频地址
 */
- (void)playVideoWithPath:(NSURL *)url{
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    self.videoPlayer = [AVPlayer playerWithPlayerItem:item];
    self.videoPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    self.videoPlayerLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.videoPlayerLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    [self.superView.layer insertSublayer:self.videoPlayerLayer above:[self.recorder previewLayer]];
    [[self.recorder previewLayer] removeFromSuperlayer];
    [self closeVideo];
    [self.videoPlayer play];
}

/**
 获取视频数据路径
 
 @param callback 回调 失败路径为nil
 */
- (void)getVideoAndThumbnailPathWithBlock:(void (^)(NSString *videoPath , NSString *thumbnailPath))callback{
    __weak typeof(self)weakSelf = self;
    [self.videoFileManager saveVideoToPhotoLibraryCompleteBock:^(BOOL videoWriteResult) {
        if (callback) {
            callback(weakSelf.videoFileManager.currentVideoPath,weakSelf.videoFileManager.currentThumbnailPath);
        }
    }];
}

/**
 获取视频时长
 
 @return 时长
 */
- (CGFloat)getRecordTime{
    return self.recordingTime;
}

/**
 切换摄像头
 */
- (void)exchangeCamera{
    [self.recorder swapFrontAndBackCameras];
}

///录制开始回调
- (void)recorderDidBeginRecording:(ShortVideoRecorder *)recorder {
    NSLog(@"%s",__func__);
}

//录制结束回调
- (void)recorderDidEndRecording:(ShortVideoRecorder *)recorder {
    NSLog(@"%s",__func__);
}

//视频录制结束回调
- (void)recorder:(ShortVideoRecorder *)recorder didFinishRecordingToOutputFilePath:(NSString *)outputFilePath error:(NSError *)error {
    //录制完成 保存图片
    [self.videoFileManager saveVideoThumbnailToPhotoLibraryWithOrientation:[recorder getRecordingOrientation]];
}

#pragma mark - 定时器相关

/**
 开启监听计时器
 */
- (void)startTimer{
    self.recordingTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.TimeInterval target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
}

/**
 停止监听计时器
 */
- (void)timerStop{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

/**
 录制进度条监听
 */
- (void)progressChange{
    
    self.recordingTime += self.TimeInterval;
    
    if (self.recordingTime >= self.VideoRecordMaxTime) {
        if ([self.delegate respondsToSelector:@selector(recordTimerEnd:)]) {
            [self.delegate recordTimerEnd:self];
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(recordProgressChange:)]) {
        [self.delegate recordProgressChange:self.recordingTime / self.VideoRecordMaxTime];
    }
}

@end
