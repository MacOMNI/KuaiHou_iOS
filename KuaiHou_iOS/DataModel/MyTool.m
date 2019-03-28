//
//  MyTool.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/14.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyTool.h"
#import<CommonCrypto/CommonDigest.h>

@interface MyTool()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, TZImagePickerControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, assign) NSInteger maxNum;
@property (nonatomic, copy)  void(^ValueChangeBlock)(UITextField* textField);
@end

@implementation MyTool


+(instancetype )shareInstance
{
    static dispatch_once_t onceToken;
    static MyTool *_sharedManager = nil;
    dispatch_once(&onceToken, ^{
        _sharedManager = [MyTool new];
        
    });
    return _sharedManager;
}

#pragma mark 判断是否是空字串
+ (BOOL)isBlankString:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
    }
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [string isEqualToString:@"NULL"] || [string isEqualToString:@"null"]) {
        
        return YES;
    }
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isEqual:nil]
        ||  [string isEqual:Nil]){
        return YES;
    }
    if (![string isKindOfClass:[NSString class]])
    {
        return YES;
    }
    if (0 == [string length]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    
    //    if([string isEqualToString:@"(null)"]){
    //        return YES;
    //    }
    
    return NO;
}


/**
 时间转换
 
 @param timeSp 时间戳
 @return <#return value description#>
 */
+(NSString *)compareCurrentTime:(NSNumber *)timeSp isMicrosecond:(BOOL )isMicrosecond {
    NSString *createTimeSp = [NSString stringWithFormat:@"%@",timeSp];
    NSTimeInterval timeInterval1 = isMicrosecond ? [createTimeSp doubleValue]/1000 : [createTimeSp doubleValue];
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timeInterval1];
    //把字符串转为NSdate
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:createDate];
    long temp = 0;
    NSString *result;
    
    if (timeInterval/60 < 1) {
        
        result = [NSString stringWithFormat:@"刚刚"];
        
    } else if((temp = timeInterval/60) < 60) {
        
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
        
    } else if((temp = temp/60) < 24) {
        
        result = [NSString stringWithFormat:@"%ld小时前",temp];
        
    } else if((temp = temp/24) <= 3) {
        
        result = [NSString stringWithFormat:@"%ld天前",temp];
        
    } else {
        NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timeInterval1];
        // 日期格式化类
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        NSString *createTime = [fmt stringFromDate:createDate];
        result = createTime;
    }
    return result;
}


#pragma mark 指定宽度获取label的高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:( int)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

#pragma mark 获取label的高度
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(int )font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    [label sizeToFit];
    return label.frame.size.width;
}

+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navi = (UINavigationController *)rootVC;
            UIViewController *vc = [navi.viewControllers lastObject];
            result = vc;
            rootVC = vc.presentedViewController;
            continue;
        } else if([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)rootVC;
            result = tab;
            rootVC = [tab.viewControllers objectAtIndex:tab.selectedIndex];
            continue;
        } else if([rootVC isKindOfClass:[UIViewController class]]) {
            result = rootVC;
            rootVC = nil;
        }
    } while (rootVC != nil);
    
    return result;
    
}

/**
 加载网络图片
 
 @param imageView 目标视图
 @param urlStr 目标URL
 @param imageName 站位图名字
 */
+(void)sd_ImageView:(UIImageView *)imageView URLStr:(NSString *)urlStr placeholderImage:(NSString *)imageName{
    if ([MyTool isBlankString:urlStr]) {
        return;
    }
}

+(void)fixCornerradius:(UIView *)view
          cornerRadius:(CGFloat )corner
                 Color:(UIColor *)color
                 Width:(CGFloat )width
{
    view.layer.cornerRadius = corner;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = width;
}


#pragma mark 拍照并且返回照片
-(void)takePhoto{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) && iOS7Later) {
        // 无相机权限 做一个友好的提示
        [MyTool showAlertWithVc:[MyTool getCurrentVC] title:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" btnName:@"确定" cancelName:@"取消" clickAlertBtnBlock:^(UIAlertAction *action) {
            // 去设置界面，开启相机访问权限
            if (iOS8Later) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        } cancelBlock:nil];
    }else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        if (iOS7Later) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self takePhoto];
                    });
                }
            }];
        } else {
            [self takePhoto];
        }
        // 拍照之前还需要检查相册权限
    }else if ([[TZImageManager manager] authorizationStatusAuthorized] == NO) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        [MyTool showAlertWithVc:[MyTool getCurrentVC] title:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" btnName:@"确定" cancelName:@"取消" clickAlertBtnBlock:^(UIAlertAction *action) {
            // 去设置界面，开启相机访问权限
            if (iOS8Later) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        } cancelBlock:nil];
    }else{
        // 进入拍照正常
        [self pushImagePickerController];
    }
}

#pragma mark 系统提示框
+(void)showAlertWithVc:(UIViewController *)vc title:(NSString *)title message:(NSString *)message btnName:(NSString *)btnName cancelName:(NSString *)cancelName clickAlertBtnBlock:(ClickAlertBtnBlock)clickAlertBtnBlock cancelBlock:(CancelAlertBtnBlock)cancelBlock
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:btnName style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              clickAlertBtnBlock(action);
                                                          }];
    [defaultAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             cancelBlock(action);
                                                         }];
    [cancelAction setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    MAIN(^{
        [vc presentViewController:alert animated:YES completion:nil];
    });
}

// 调用相机
-(void)pushImagePickerController{
    // 提前定位
    __weak typeof(self) weakSelf = self;
    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = [locations firstObject];
    } failureBlock:^(NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = nil;
    }];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        //        if (self.showTakeVideoBtnSwitch.isOn) {
        //            [mediaTypes addObject:(NSString *)kUTTypeMovie];
        //        }
        [mediaTypes addObject:(NSString *)kUTTypeImage];
        if (mediaTypes.count) {
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        if (iOS8Later) {
            _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        }
        [[MyTool getCurrentVC] presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    // tzImagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image location:self.location completion:^(PHAsset *asset, NSError *error){
            if (error) {
                [tzImagePickerVc hideProgressHUD];
                NSLog(@"图片保存失败 %@",error);
            } else {
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES needFetchAssets:NO completion:^(TZAlbumModel *model) {
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        [tzImagePickerVc hideProgressHUD];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        //if (self.allowCropSwitch.isOn) { // 允许裁剪,去裁剪
                        //                            TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
                        //                                [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
                        //                            }];
                        //    imagePicker.needCircleCrop = cropRect;
                        //  imagePicker.circleCropRadius = 100;
                        //    [self presentViewController:imagePicker animated:YES completion:nil];
                        //  }
                        //else {
                        [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                        //                   }
                    }];
                }];
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                if (!error) {
                    [[TZImageManager manager] getCameraRollAlbum:YES allowPickingImage:NO needFetchAssets:NO completion:^(TZAlbumModel *model) {
                        [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:YES allowPickingImage:NO completion:^(NSArray<TZAssetModel *> *models) {
                            [tzImagePickerVc hideProgressHUD];
                            TZAssetModel *assetModel = [models firstObject];
                            if (tzImagePickerVc.sortAscendingByModificationDate) {
                                assetModel = [models lastObject];
                            }
                            [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                                if (!isDegraded && photo) {
                                    [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                                }
                            }];
                        }];
                    }];
                } else {
                    [tzImagePickerVc hideProgressHUD];
                }
            }];
        }
    }
}
- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
    if (self.didFinishPickingPhotosHandle) {
        self.didFinishPickingPhotosHandle(image, asset);
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        //        _imagePickerVc.navigationBar.backgroundColor = [UIColor blackColor];
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            if (@available(iOS 9.0, *)) {
                tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            } else {
                // Fallback on earlier versions
            }
            if (@available(iOS 9.0, *)) {
                BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
            } else {
                // Fallback on earlier versions
            }
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}

#pragma mark -md5
+(NSString *)md5:(NSString *)input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

+(BOOL)MatchLetter:(NSString *)str
{
    if ([MyTool isBlankString:str]) {
        return NO;
    }
    str = [str substringToIndex:1];
    //判断是否以字母开头
    NSString *ZIMU = @"^[A-Za-z]+$";
    NSPredicate *regextestA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ZIMU];
    
    if ([regextestA evaluateWithObject:str] == YES)
        return YES;
    else
        return NO;
}

+(BOOL)isChineseFirst:(NSString *)firstStr
{
    //是否以中文开头(unicode中文编码范围是0x4e00~0x9fa5)
    int utfCode = 0;
    void *buffer = &utfCode;
    NSRange range = NSMakeRange(0, 1);
    //判断是不是中文开头的,buffer->获取字符的字节数据 maxLength->buffer的最大长度 usedLength->实际写入的长度，不需要的话可以传递NULL encoding->字符编码常数，不同编码方式转换后的字节长是不一样的，这里我用了UTF16 Little-Endian，maxLength为2字节，如果使用Unicode，则需要4字节 options->编码转换的选项，有两个值，分别是NSStringEncodingConversionAllowLossy和NSStringEncodingConversionExternalRepresentation range->获取的字符串中的字符范围,这里设置的第一个字符 remainingRange->建议获取的范围，可以传递NULL
    BOOL b = [firstStr getBytes:buffer maxLength:2 usedLength:NULL encoding:NSUTF16LittleEndianStringEncoding options:NSStringEncodingConversionExternalRepresentation range:range remainingRange:NULL];
    if (b && (utfCode >= 0x4e00 && utfCode <= 0x9fa5))
        return YES;
    else
        return NO;
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

#pragma mark -  判断字符串是否为空,为空的话返回 “” （一般用于保存字典时）
+(NSString *)isNotNull:(id)string
{
    NSString * str = (NSString*)string;
    if ([self isBlankString:str]){
        string = @"";
    }
    return string;
    
}

/**
 空数据展示页面
 
 @param count count description
 @param viewController viewController description
 @param view view description
 @param title title description
 @param imageName imageName description
 */
+(void)fixNoDataCount:(NSInteger )count viewController:(UIViewController *)viewController tragetView:(UIView *)view title:(NSString *)title imageName:(NSString *)imageName{
    if (count == 0) {
        if (viewController.emptyView) {
            [viewController.emptyView removeFromSuperview];
        }
        viewController.emptyView = [PLEmptyViewFactory emptyNoDataViewWithView:view title:title imageName:imageName];
    }else{
        if (viewController.emptyView) {
            [viewController.emptyView removeFromSuperview];
        }
    }
}


/**
 网络请求数据错误界面
 
 @param viewController viewController description
 @param view view description
 @param btnBlock btnBlock description
 */
+(void)fixNetErrByViewController:(UIViewController *)viewController tragetView:(UIView *)view btnBlock:(void (^)(void))btnBlock{
    viewController.emptyView = [PLEmptyViewFactory errorDataWithView:view btnBlock:btnBlock];
}

// 实现图文混排的方法
+ (NSAttributedString *)creatAttrStringWithText:(NSString *) text image:(UIImage *) image font:(UIFont *)font {
    
    // NSTextAttachment可以将图片转换为富文本内容
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
    // 通过NSTextAttachment创建富文本
    // 图片的富文本
    NSAttributedString *imageAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 文字的富文本
    NSAttributedString *textAttr = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:font}];
    
    NSMutableAttributedString *mutableAttr = [[NSMutableAttributedString alloc] init];
    
    // 将图片、文字拼接
    // 如果要求图片在文字的后面只需要交换下面两句的顺序
    [mutableAttr appendAttributedString:imageAttr];
    [mutableAttr appendAttributedString:textAttr];
    
    return [mutableAttr copy];
}

//获取当前时间戳有两种方法(以秒为单位)
+ (NSString *)getNowTimeTimestamp {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
    
}


/*
 周边加阴影，并且同时圆角
 */
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius
{
    //////// shadow /////////
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = view.layer.frame;
    
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 4);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//0.8;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    
    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;
    
    //////// cornerRadius /////////
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [view.superview.layer insertSublayer:shadowLayer below:view.layer];
}


/**
 *  根据文字内容动态计算UILabel宽高
 *  @param maxWidth label宽度
 *  @param font  字体
 *  @param lineSpacing  行间距
 *  @param text  内容
 */
+ (CGSize)boundingRectWithWidth:(CGFloat)maxWidth
                   withTextFont:(UIFont *)font
                withLineSpacing:(CGFloat)lineSpacing
                           text:(NSString *)text {
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //设置行间距
    [paragraphStyle setLineSpacing:lineSpacing];
    //#warning 此处设置NSLineBreakByTruncatingTail会导致计算文字高度方法失效
    //    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    
    //计算文字尺寸
    CGSize size = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return size;
}

/**
 *  NSString转换成NSMutableAttributedString
 *  @param font  字体
 *  @param lineSpacing  行间距
 *  @param text  内容
 */
+ (NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                 withLineSpacing:(CGFloat)lineSpacing
                                                            text:(NSString *)text {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail]; //截断方式，"abcd..."
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [text length])];
    return attributedStr;
}

/**
 *  设置阴影
 */
+ (void)setShadowView:(UIView *)view shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius {
    view.layer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    view.layer.shadowOffset = shadowOffset;//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    view.layer.shadowRadius = shadowRadius;//阴影半径，默认3
}

/**
 * 创建特殊button
 */
+ (UIButton *)setupWithButton:(NSString *)title imgageStr:(NSString *)imageStr tag:(NSInteger)tag btnSize:(CGSize)btnSize fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    btn.size = btnSize;//CGSizeMake(SCREEN_WIDTH / 4, 90);
    btn.tag = tag;
    
    //调整图片和文字上下显示
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-btn.titleLabel.frame.size.height, 0.0,0.0, -btn.titleLabel.bounds.size.width)];
    
    return btn;
}

/**
 *  创建label
 */
+ (UILabel *)setupLabel:(NSString *)title textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = font;
    titleLabel.textColor = textColor;
    titleLabel.textAlignment = textAlignment;
    return titleLabel;
}

/*
 *  图文混排
 */
+ (NSMutableAttributedString *)stringWithImage:(NSString *)imageName textStr:(NSString *)textStr {
    //拿到整体的字符串
    NSMutableAttributedString *numberString = [[NSMutableAttributedString alloc] initWithString:textStr];
    // 创建图片图片附件
    UIImage *numberImage = [UIImage imageNamed:imageName];
    NSTextAttachment *numberAttach = [[NSTextAttachment alloc] init];
    numberAttach.image = numberImage;
    numberAttach.bounds = CGRectMake(0, -2.5, numberImage.size.width, numberImage.size.height);//-((20 - numberImage.size.height) / 2)
    NSAttributedString *numberAttachString = [NSAttributedString attributedStringWithAttachment:numberAttach];
    
    //将图片插入到合适的位置
    [numberString insertAttributedString:numberAttachString atIndex:0];
    return numberString;
}






@end
