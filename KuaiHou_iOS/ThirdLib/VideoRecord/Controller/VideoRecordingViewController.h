//
//  VideoRecordingViewController.h
//  Zing
//
//  Created by 胡广宇 on 2017/3/29.
//  Copyright © 2017年 Witgo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoRecordingViewController : UIViewController

@property (nonatomic, copy) void (^finshRecord)(NSString *videoPath, NSString *thumbnailPath, CGFloat recordTime);

@end
