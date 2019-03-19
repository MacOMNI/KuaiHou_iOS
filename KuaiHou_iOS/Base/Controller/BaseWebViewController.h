//
//  BaseWebViewController.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : BaseViewController

@property(nonatomic,strong)WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
