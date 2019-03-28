//
//  SendDynamicsVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/20.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "SendDynamicsVC.h"
#import "XXTextView.h"
#import "SendDynamicsHeadView.h"
#import "SendDynamicsVideoCell.h"

@interface SendDynamicsVC ()<TZImagePickerControllerDelegate,UIActionSheetDelegate>
{
    NSString *type;
    NSString *cityCode;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSMutableArray *selectPhotoArr;
@property (nonatomic, strong) NSMutableArray *selectedAssets;
@property (nonatomic, weak) SendDynamicsHeadView *headView;
@property (nonatomic, strong) NSString *contentStr;
@property (nonatomic, strong) XXTextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *safeBottomH;

@property (weak, nonatomic) IBOutlet UIButton *selPhotoBtn;
@property (weak, nonatomic) IBOutlet UIButton *selVideoBtn;

@property (nonatomic, copy) NSString *videoPath;

@end

@implementation SendDynamicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
}

-(void)fixUI{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SendDynamicsVideoCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([SendDynamicsVideoCell class])];
    // 右
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 60, 30);
    [btn setBackgroundColor:kMain_lineColor];
    [btn setTitleColor:kMain_TextColor forState:(UIControlStateNormal)];
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [MyTool fixCornerradius:btn cornerRadius:15 Color:kMain_lineColor_C Width:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.safeBottomH.constant = 60 + SafeAreaBottom;
    [self setHeadView];
}

-(void)setSelectPhotoArr:(NSMutableArray *)selectPhotoArr{
    _selectPhotoArr  = selectPhotoArr;
    self.selVideoBtn.enabled = selectPhotoArr.count == 0;
    kWEAKSELF
    [_headView reloadDataWithImageArray:_selectPhotoArr blockHeight:^(CGFloat height) {
        NSLog(@"%f", height);
        weakSelf.headView.frame = CGRectMake(0, 0, kScreenSizeWidth, height + 10);
        [self.tableView reloadData];
    }];
}
-(void)setVideoPath:(NSString *)videoPath{
    _videoPath = videoPath;
    MAIN(^{
        self.selPhotoBtn.enabled = videoPath.length == 0;
    });
    
    [self.tableView reloadData];
}

-(void)setHeadView{
    _selectPhotoArr = [NSMutableArray new];
    SendDynamicsHeadView *headView = [[SendDynamicsHeadView alloc] init];
    _headView = headView;
    self.tableView.tableHeaderView = headView;
    kWEAKSELF;
    [headView reloadDataWithImageArray:_selectPhotoArr blockHeight:^(CGFloat height) {
        NSLog(@"%f", height);
        headView.frame = CGRectMake(0, 0, kScreenSizeWidth, height + 10);
        [self.tableView reloadData];
    }];
    headView.selectItem = ^(BOOL isAdd, NSUInteger  indexRow) {
        if (isAdd) {
            
            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"去相册选择", nil];
            sheet.tag = 888;
            [sheet showInView:self.view];
        }else{
            [weakSelf previewPhotoWithIndex:indexRow];
        }
    };
    headView.delBlock = ^(NSInteger indexRow) {
        [self.selectPhotoArr removeObjectAtIndex:indexRow];
        self.selectPhotoArr = self.selectPhotoArr;
        
        [self.selectedAssets removeObjectAtIndex:indexRow];
    };
    
    [headView setChangeTextField:^(UITextView * _Nonnull textView) {
        NSLog(@"%@", textView.text);
        self.contentStr = textView.text;
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([MyTool isBlankString:self.videoPath]) {
        return 0;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 270;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SendDynamicsVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SendDynamicsVideoCell class]) forIndexPath:indexPath];
    cell.videoImageView.image = [self getScreenShotImageFromVideoPath:_videoPath];
    [cell setDelBlock:^{
        self.videoPath = nil;
    }];
    [cell setPlayBlock:^{
        
    }];
    return cell;
}

#pragma mark 选择照片
-(void)pushTZImagePickerController{
    TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVC.allowPickingVideo = NO;   // 不在内部显示视频
    imagePickerVC.allowTakePicture = NO; // 能否拍照
    imagePickerVC.allowTakeVideo = NO; // 能否拍视频
    imagePickerVC.showPhotoCannotSelectLayer = YES;
    if (_selectedAssets.count > 0 && _selectedAssets.count < 10) {
        imagePickerVC.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.selectPhotoArr = photos.mutableCopy;
        self.selectedAssets = [NSMutableArray arrayWithArray:assets];
    }];
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

-(void)pushTZImageVideoController{
    TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVC.allowPickingVideo = YES;   // 在内部显示视频
    imagePickerVC.allowPickingImage = NO; // 能否选择照片
    imagePickerVC.allowTakeVideo = NO; // 能否拍视频
    imagePickerVC.allowTakePicture = NO; // 能否拍照
    imagePickerVC.showPhotoCannotSelectLayer = YES;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

// 选择视频的回调
-(void)imagePickerController:(TZImagePickerController *)picker
       didFinishPickingVideo:(UIImage *)coverImage
                sourceAssets:(PHAsset *)asset{
    NSLog(@"选择了视频");
    [self getSelectVideoURl:asset];
}

#pragma mark-获取选中的视频资源  选择视频完成后应该跳到编辑界面
-(void)getSelectVideoURl:(id)asset{
    PHAsset *phAsset = asset;
    if (phAsset.mediaType == PHAssetMediaTypeVideo) {
        PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
        options.version = PHImageRequestOptionsVersionCurrent;
        options.networkAccessAllowed = true;
        options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
        PHImageManager *manager = [PHImageManager defaultManager];
        [manager requestAVAssetForVideo:phAsset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
            AVURLAsset *urlAsset = (AVURLAsset *)asset;
            
            NSURL *url = urlAsset.URL;
            NSLog(@"%@", url);
            self.videoPath = url.path;
            
            
        }];
    }
}

#pragma mark 预览照片
-(void)previewPhotoWithIndex:(NSUInteger)index
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:self.selectPhotoArr index:index];
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingMultipleVideo = NO;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.selectPhotoArr = photos.mutableCopy;
        self.selectedAssets = [NSMutableArray arrayWithArray:assets];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 888) {
        if (buttonIndex == 0) { // take photo / 去拍照
            [[MyTool shareInstance] takePhoto];
            [[MyTool shareInstance] setDidFinishPickingPhotosHandle:^(UIImage * _Nonnull photoImage, id  _Nonnull asset) {
                [self.selectPhotoArr addObject:photoImage];
                self.selectPhotoArr = self.selectPhotoArr;
                [self.selectedAssets addObject:asset];
            }];

        } else if (buttonIndex == 1) {
            [self pushTZImagePickerController];
        }

    }
    if (actionSheet.tag == 999) {
        if (buttonIndex == 0) {
            
        }else if(buttonIndex == 1){
            [self pushTZImageVideoController];
        }
    }
}
- (UIImage *)getScreenShotImageFromVideoPath:(NSString *)filePath{
    UIImage *shotImage;
    //视频路径URL
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:fileURL options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    shotImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return shotImage;
}


-(void)sendAction{
    
}
- (IBAction)selPhotoAction:(UIButton *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册选择照片", nil];
    sheet.tag = 888;
    [sheet showInView:self.view];
}
- (IBAction)selVideoAction:(UIButton *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"录视频",@"相册选择视频", nil];
    sheet.tag = 999;
    [sheet showInView:self.view];
}

@end
