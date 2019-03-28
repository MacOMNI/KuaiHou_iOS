//
//  ReleaseEventVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ReleaseEventVC.h"
#import "OpenStoreHeadView.h"
#import "OpenStoreTextViewCell.h"
#import "OpenStoreListCell.h"
#import "ReleaseEventSliderCell.h"
#import "MainSetBtnCell.h"

@interface ReleaseEventVC ()<TZImagePickerControllerDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *selectPhotoArr; // 选择的图片
@property (nonatomic, strong) NSMutableArray *selectedAssets; // 选择的图片对应相册
@property (nonatomic, weak) OpenStoreHeadView *headView;

@end

@implementation ReleaseEventVC

-(void)setSelectPhotoArr:(NSMutableArray *)selectPhotoArr{
    _selectPhotoArr  = selectPhotoArr;
    kWEAKSELF
    [_headView reloadDataWithImageArray:_selectPhotoArr blockHeight:^(CGFloat height) {
        NSLog(@"%f", height);
        weakSelf.headView.frame = CGRectMake(0, 0, kScreenSizeWidth, height + 15);
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fixUI];
    
}

-(void)fixUI{
    self.title = @"发布活动";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ReleaseEventSliderCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ReleaseEventSliderCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainSetBtnCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MainSetBtnCell class])];
    
    [self setHeadView];
}

-(void)setHeadView{
    _selectPhotoArr = [NSMutableArray new];
    OpenStoreHeadView *headView = [[OpenStoreHeadView alloc] init];
    headView.titleLab.text = @"请上传活动图片";
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 175;
    }else if (indexPath.row == 1){
        return 44;
    }else if (indexPath.row == 2){
        return 80;
    }else if (indexPath.row == 3){
        return 86;
    }
    return 0;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"活动内容";
        cell.textView.xx_placeholder = @"请输入具体活动";
        
        [cell setChangeTextField:^(UITextView * _Nonnull textView) {
            //        self.detailStr = textView.text;
        }];
        return cell;
    }else if (indexPath.row == 1){
        OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
        cell.titleLab.text = @"活动有效期";
        cell.textField.placeholder = @"请选择活动截止时间";
        cell.textField.enabled = NO;
        cell.lineView.hidden = YES;
        return cell;
    }else if (indexPath.row == 2){
        ReleaseEventSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ReleaseEventSliderCell class]) forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row == 3){
        MainSetBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSetBtnCell class]) forIndexPath:indexPath];
        [cell.itemBtn setTitle:@"提交审核" forState:(UIControlStateNormal)];
        return cell;
    }
    
    return nil;
}

#pragma mark 选择照片
-(void)pushTZImagePickerController{
    TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:6 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVC.allowPickingVideo = NO;   // 不在内部显示视频
    imagePickerVC.allowTakePicture = NO; // 能否拍照
    imagePickerVC.allowTakeVideo = NO; // 能否拍视频
    imagePickerVC.showPhotoCannotSelectLayer = YES;
    if (_selectedAssets.count > 0 && _selectedAssets.count < 7) {
        imagePickerVC.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.selectPhotoArr = photos.mutableCopy;
        self.selectedAssets = [NSMutableArray arrayWithArray:assets];
    }];
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) { // 选择活动时间
        
    }
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
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
}

@end
