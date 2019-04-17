//
//  NetWorkManager.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/15.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "NetWorkManager.h"

#define default_timeOut  20.f

static NetWorkManager* _instance = nil;

@interface NetWorkManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableDictionary *taskDict;
@property (nonatomic, assign) NSInteger timeOut;
@property (nonatomic, assign) BOOL isNoDefaultResponseSerializer;
@property (nonatomic, copy) NSString *strVideo;

@end

@implementation NetWorkManager

- (NSMutableDictionary *) taskDic
{
    if (!_taskDict) {
        _taskDict = [[NSMutableDictionary alloc] init];
    }
    return _taskDict;
}
#pragma mark -头部参数格式
-(NSSet *)paramsFormat
{
    NSSet *set = [NSSet setWithObjects: @"text/html",@"text/plain", @"application/json",@"text/json", nil];
    return set;
}
#pragma mark -网络请求头部参数
- (void)manager:(AFHTTPSessionManager *)manager
{
    //设置请求格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = default_timeOut;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager.operationQueue setMaxConcurrentOperationCount:12]; //最大并发数量
    manager.responseSerializer.acceptableContentTypes = [self paramsFormat];
    ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
    
    //设置返回格式
    // manager.responseSerializer.removesKeysWithNullValues = YES;
    
}
#pragma mark -网络请求 参数
/***
 *必填参数:
 time         时间戳
 sign            时间戳签名
 **/
- (NSMutableDictionary *)params:(NSDictionary *)params
{
    //    设置请求头信息
    //    NSString *token = [UserInfoManager sharedManager].currentUserInfo.token;
    //    NSString *beforeMd5 = [NSString stringWithFormat:@"%@{%@}",KappNo,Ksecret];
    //    NSString *afterMd5 = [MyTool md5:beforeMd5];
    //    [self.sessionManager.requestSerializer setValue:afterMd5 forHTTPHeaderField:@"sign"];
    //    [self.sessionManager.requestSerializer setValue:KappNo forHTTPHeaderField:@"appNo"];
    //    [self.sessionManager.requestSerializer setValue:[MyTool isNotNull:token] forHTTPHeaderField:@"token"];
    NSMutableDictionary* tempParams = [NSMutableDictionary dictionaryWithDictionary:params];
    
    
    return tempParams;
}

#pragma mark -单例初始化当前管理网络访问请求类
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
#pragma mark- 对外暴露创建单例对象方法
+(instancetype)shareInstance
{
    return [[self alloc]init];
}
#pragma mark- 初始化网络访问库管理类
- (instancetype)init
{
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
        [self manager:_sessionManager];
    }
    return self;
}
#pragma mark -设置超时时间
-(void)sTimeOut:(NSInteger)timeOut
{
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _sessionManager.requestSerializer.timeoutInterval = timeOut;
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}

//如果正在执行的话
- (void)cancelUrl:(NSString *)url
{
    NSURLSessionDataTask *dataTask =[self.taskDict objectForKey:url];
    
    [dataTask cancel];
    [self.taskDict removeObjectForKey:url];
}

#pragma mark -post请求方式获取数据
- (void)POSTNetworkRequestUrlString:(NSString *)urlString
                             params:(id)params
                            success:(ResultBlock)success
                               fail:(FailError)fail
{
    NSString *baseUrl = BASE_URL(urlString);
    
    [self cancelUrl:baseUrl];
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _sessionManager.requestSerializer.timeoutInterval = _timeOut<=0?default_timeOut:_timeOut;
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    NSURLSessionDataTask *dataTask = [_sessionManager POST:baseUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_timeOut = 0;
        //[self.taskDict removeObjectForKey:urlString];
        [self removeTask:task];
        //        BOOL isSuccess = [responseObject[CODE_NAME] isEqualToString:CODE_SUCCESS];
        //        BOOL tokenInvalid = [responseObject[CODE_NAME] isEqualToString:CODE_FAILURE]||[responseObject[CODE_NAME] isEqualToString:CODE_FAILURE1]||[responseObject[CODE_NAME] isEqualToString:CODE_FAILURE2];
        //        //登录token失效
        //        if (tokenInvalid) {
        //            [[NSNotificationCenter defaultCenter] postNotificationName:KDidTokenInvalid object:responseObject[CODE_NAME]];
        //        }
        
        if (success) {
            //            success(isSuccess,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误信息:%@",error);
        self->_timeOut = 0;
        [self removeTask:task];
        //  [self.taskDict removeObjectForKey:urlString];
        if (fail) {
            fail();
        }
    }];
    [self addTask:dataTask];
    
}


#pragma mark -get请求方式获取数据
- (void)GETNetworkRequestUrlString:(NSString *)urlString
                            params:(id)params
                           success:(ResultBlock)success
                              fail:(FailError)fail
{
    NSString *baseUrl = BASE_URL(urlString);
    
    [self cancelUrl:baseUrl];
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _sessionManager.requestSerializer.timeoutInterval = _timeOut<=0?default_timeOut:_timeOut;
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    NSURLSessionDataTask *dataTask = [_sessionManager GET:baseUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_timeOut = 0;
        [self removeTask:task];
        //   [self.taskDict removeObjectForKey:urlString];
        //        BOOL isSuccess = [responseObject[CODE_NAME] isEqualToString:CODE_SUCCESS];
        //        BOOL tokenInvalid = [responseObject[CODE_NAME] isEqualToString:CODE_FAILURE]||[responseObject[CODE_NAME] isEqualToString:CODE_FAILURE1]||[responseObject[CODE_NAME] isEqualToString:CODE_FAILURE2];
        //        //登录token失效
        //        if (tokenInvalid) {
        //            [[NSNotificationCenter defaultCenter] postNotificationName:KDidTokenInvalid object:responseObject[CODE_NAME]];
        //        }
        
        if (success) {
            //            success(isSuccess,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误信息:%@",error);
        [self removeTask:task];
        //  [self.taskDict removeObjectForKey:urlString];
        self->_timeOut = 0;
        if (fail) {
            fail();
        }
    }];
    // self.taskDict[urlString] = dataTask;
    [self addTask:dataTask];
}

#pragma mark - POST上传文件
- (void)postUploadWithUrl:(NSString *)urlString params:(NSDictionary *)params fileData:(NSData *)fileData fileType:(NSString *)fileType success:(ResultBlock)success fail:(FailError)fail
{
    NSString *baseUrl = BASE_URL(urlString);
    //设置返回格式
    AFHTTPResponseSerializer *responseSerializer =[AFHTTPResponseSerializer serializer];
    _sessionManager.responseSerializer = responseSerializer;
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _sessionManager.requestSerializer.timeoutInterval = _timeOut<=0?default_timeOut:_timeOut;
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [_sessionManager POST:baseUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        self->_timeOut = 0;
        NSString* mimeType = nil;
        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
        NSTimeInterval a = [date timeIntervalSince1970]*1000;
        NSString* timeStr = [NSString stringWithFormat:@"%.0f", a];//转为字符型
        
        if ([fileType rangeOfString:@"png"].location != NSNotFound) {
            mimeType = @"image/png";
        }else if([fileType rangeOfString:@"mp3"].location != NSNotFound){
            mimeType = @"audio/mp3";
        }else if([fileType rangeOfString:@"mp4"].location != NSNotFound){
            mimeType = @"audio/mp4";
        }
        [formData appendPartWithFileData:fileData name:@"files" fileName:[NSString stringWithFormat:@"%@.%@",timeStr,fileType] mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_timeOut = 0;
        if (success) {
            success(YES,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        self->_timeOut = 0;
        if (fail) {
            fail();
        }
    }];
}

#pragma mark 上传图片
-(void)postUpLoadImageWithUrl:(NSString *)urlString params:(NSDictionary *)params imageArray:(NSArray <UIImage *> *)imageArray success:(ResultBlock)success fail:(FailError)fail{
    NSString *baseUrl = BASE_URL(urlString);
    //设置返回格式
    AFHTTPResponseSerializer *responseSerializer =[AFHTTPResponseSerializer serializer];
    _sessionManager.responseSerializer = responseSerializer;
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _sessionManager.requestSerializer.timeoutInterval = _timeOut<=0?default_timeOut:_timeOut;
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [_sessionManager POST:baseUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        self->_timeOut = 0;
        for (int i = 0; i < imageArray.count; i++) {
            NSData *imageData = UIImageJPEGRepresentation(imageArray[i], 0.5);
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"field_%d", i] fileName:[NSString stringWithFormat:@"field_%d.jpg",i] mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self->_timeOut = 0;
        if (success) {
            success(YES,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self->_timeOut = 0;
        if (fail) {
            fail();
        }
    }];
}


#pragma mark -

//添加队列
-(void)addTask:(NSURLSessionDataTask *)task
{
    NSMutableDictionary* taskQueue = [self taskQueue];
    [taskQueue setObject:task forKey:@([NSDate date].timeIntervalSince1970)];
}
#pragma mark -------------------------------------------------
//删除队列
-(void)removeTask:(NSURLSessionDataTask *)task
{
    if ([self ifRquesting]) {
        NSMutableDictionary* taskQueue = [self taskQueue];
        [taskQueue removeObjectForKey:@([NSDate date].timeIntervalSince1970)];
    }
}

-(NSMutableDictionary *)taskQueue
{
    NSMutableDictionary* taskDic =  objc_getAssociatedObject(self, @selector(addTask:));
    if (!taskDic) {
        taskDic = @{}.mutableCopy; objc_setAssociatedObject(self,@selector(addTask:),taskDic,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return taskDic;
}

//判断有没有执行中的队列
-(BOOL)ifRquesting{
    NSMutableDictionary* taskDic =  objc_getAssociatedObject(self, @selector(addTask:));
    if (taskDic.allValues.count>0) {
        return YES;
    }
    return NO;
}

-(void)cancelRequest
{
    if ([self ifRquesting]) {
        NSMutableDictionary* taskQueue = [self taskQueue];
        NSLog(@"没结束的队列 === %lu",(unsigned long)taskQueue.allKeys.count);
        [taskQueue enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (((NSURLSessionDataTask *)obj).state != NSURLSessionTaskStateCompleted) {
                [((NSURLSessionDataTask *)obj) cancel];
                NSLog(@"取消了一个请求");
            }
        }];
        [taskQueue removeAllObjects];
    }
}

@end
