//
//  NetWorkManager.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#define APIManagerInstance [NetWorkManager shareInstance]
typedef void(^ResultBlock)(BOOL isSuccess,id responseObject);
typedef void(^upLoadImgResultBlock)(NSArray<NSString *> *names, Boolean state);
typedef void(^upLoadIndexBlock)(NSInteger index);
typedef void(^FailError)(void);
typedef void(^FileURL)(NSURL *fileURL);
typedef void(^NetWorkError)(void);
typedef void(^NetWorkStatusBlock)(NSString* statusName,AFNetworkReachabilityStatus status);
typedef void(^CompletionHandler)(NSURLResponse *response, NSURL *filePath, NSError *error);
typedef void(^DownloadProgress) (CGFloat progress,CGFloat total,CGFloat current);

@interface NetWorkManager : NSObject
#pragma mark- 对外暴露创建单例对象方法
+ (instancetype)shareInstance;
#pragma mark -设置超时时间
-(void)sTimeOut:(NSInteger)timeOut;
-(void)cancelRequest;
#pragma mark -get请求方式获取数据
- (void)GETNetworkRequestUrlString:(NSString *)urlString
                            params:(id)params success:(ResultBlock)success
                              fail:(FailError)fail;

#pragma mark -post请求方式获取数据
- (void)POSTNetworkRequestUrlString:(NSString *)urlString
                             params:(id)params success:(ResultBlock)success
                               fail:(FailError)fail;

#pragma mark - POST上传文件
- (void)postUploadWithUrl:(NSString *)urlString params:(NSDictionary *)params fileData:(NSData *)fileData fileType:(NSString *)fileType success:(ResultBlock)success fail:(FailError)fail;

#pragma mark 上传图片
-(void)postUpLoadImageWithUrl:(NSString *)urlString params:(NSDictionary *)params imageArray:(NSArray <UIImage *> *)imageArray success:(ResultBlock)success fail:(FailError)fail;

@end

NS_ASSUME_NONNULL_END
