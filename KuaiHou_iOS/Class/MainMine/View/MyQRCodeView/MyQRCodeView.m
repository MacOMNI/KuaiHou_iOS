//
//  MyQRCodeView.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyQRCodeView.h"

@interface MyQRCodeView ()

@property (nonatomic, strong) UIView *maskView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet MLLinkLabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@end

@implementation MyQRCodeView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"MyQRCodeView" owner:nil options:nil].lastObject;
        self.width = kScreenSizeWidth - 50;
        self.height = 450;
        self.center = [UIApplication sharedApplication].keyWindow.center;
        [self fixUI];
        
        self.transform = CGAffineTransformMakeScale(0.05, 0.05);
        
        
    }
    
    
    return self;
}


-(void)fixUI{
    self.qrCodeImageView.image = [self createQRCodeWithUrl:@"郭子豪"];
    
    [self fixTitleLabByName:@"时光无声" Content:@"邀请你加入快逅"];
}

-(void)fixTitleLabByName:(NSString *)name Content:(NSString *)content{
    
    NSString *newContentStr = [NSString stringWithFormat:@"%@%@", name, content];
    
    self.titleLab.font = kFont(15);
    self.titleLab.textColor = kMain_TextColor;
    self.titleLab.dataDetectorTypes = MLDataDetectorTypeAttributedLink;
    self.titleLab.allowLineBreakInsideLinks = NO;
    self.titleLab.linkTextAttributes = @{NSForegroundColorAttributeName:kMainColor};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:newContentStr];
    [attrStr addAttribute:NSLinkAttributeName value:@"111" range:NSMakeRange(0, name.length)];
    self.titleLab.activeLinkTextAttributes = @{NSForegroundColorAttributeName:kMainColor,NSBackgroundColorAttributeName:[UIColor whiteColor]};
    self.titleLab.attributedText = attrStr;
    
    [self.titleLab setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        NSString *tips = [NSString stringWithFormat:@"Click\nlinkType:%ld\nlinkText:%@\nlinkValue:%@",link.linkType,linkText,link.linkValue];
        NSLog(@"%@", tips);
    }];
    
//    [self.titleLab invalidateDisplayForLinks];
}




- (UIImage *)createQRCodeWithUrl:(NSString *)url {
    // 1. 创建一个二维码滤镜实例(CIFilter)
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 滤镜恢复默认设置
    [filter setDefaults];
    
    // 2. 给滤镜添加数据
    NSString *string = url;
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 使用KVC的方式给filter赋值
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 3. 生成二维码
    CIImage *image = [filter outputImage];
    // 转成高清格式
    UIImage *qrcode = [self createNonInterpolatedUIImageFormCIImage:image withSize:175];
    // 添加logo
//    qrcode = [self drawImage:QLNamedImage(@"qr_logo") inImage:qrcode];
    return qrcode;
}



// 将二维码转成高清的格式
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

// 添加logo
- (UIImage *)drawImage:(UIImage *)newImage inImage:(UIImage *)sourceImage {
    CGSize imageSize; //画的背景 大小
    imageSize = [sourceImage size];
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    [sourceImage drawAtPoint:CGPointMake(0, 0)];
    //获得 图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    //画 自己想要画的内容(添加的图片)
    CGContextDrawPath(context, kCGPathStroke);
    // 注意logo的尺寸不要太大,否则可能无法识别
    CGRect rect = CGRectMake(imageSize.width / 2 - 25, imageSize.height / 2 - 25, 50, 50);
    //    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [newImage drawInRect:rect];
    
    //返回绘制的新图形
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)loadImageFinished:(UIImage *)image
{
    //参数1:图片对象
    //参数2:成功方法绑定的target
    //参数3:成功后调用方法
    //参数4:需要传递信息(成功后调用方法的参数)
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}
#pragma mark -- <保存到相册>
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    [self hiddenView];
    
}

- (IBAction)savaAction:(id)sender {
//    UIImage *image = [self openglSnapshotImage];
//
    
    UIImage *image = [self getImageViewWithView:self];
    [self loadImageFinished:image];
}
- (IBAction)shareAction:(id)sender {
    [self hiddenView];
}

/**
 针对有用过OpenGL渲染过的视图截图
 
 @return 截取的图片
 */
-(UIImage *)getImageViewWithView:(UIView *)view{
    UIGraphicsBeginImageContext(view.frame.size);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}


@end
