//
//  OpenStoreVC.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "OpenStoreVC.h"
#import "SendDynamicsHeadCell.h"
#import "OpenStoreListCell.h"
#import "OpenStoreItemCell.h"
#import "OpenStoreTextViewCell.h"
#import "OpenStoreHeadView.h"
#import "OpenStoreTipCell.h"


@interface OpenStoreVC () <TZImagePickerControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *tipArray;
@property (nonatomic, strong) NSMutableArray *selectPhotoArr; // 选择的图片
@property (nonatomic, strong) NSMutableArray *selectedAssets; // 选择的图片对应相册
@property (nonatomic, weak) OpenStoreHeadView *headView;

@property (nonatomic, strong) NSString *surnameStr; // 姓
@property (nonatomic, strong) NSString *phoneStr; // 联系方式
@property (nonatomic, strong) NSString *selAddressStr; // 选择的场所
@property (nonatomic, strong) NSString *addStr; // 所在地址
@property (nonatomic, assign) NSInteger selectTypeAddress; // 所属类型
@property (nonatomic, strong) NSString *detailStr;
@end

@implementation OpenStoreVC

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
    self.title = @"开店";
    
    self.tableView.superAnimationType = TABViewSuperAnimationTypeClassic;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.titleArray = @[@"姓名", @"联系方式", @"所属场所", @"所在地址", @"所属类型", @"店铺简介"];
    self.tipArray = @[@"请输入您的姓氏", @"请输入联系方式", @"请选择所属场所", @"请输入所在地址"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreListCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreListCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreItemCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreItemCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTextViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTextViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OpenStoreTipCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([OpenStoreTipCell class])];
    
    [self setHeadView];
}


-(void)setHeadView{
    _selectPhotoArr = [NSMutableArray new];
    OpenStoreHeadView *headView = [[OpenStoreHeadView alloc] init];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.titleArray.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kMain_lineColor;
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 4) {
            return 70;
        }
        if (indexPath.row == 5) {
            return 175;
        }
        return 44;
    }
    
    return 152.5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 4) {
            OpenStoreItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreItemCell class]) forIndexPath:indexPath];
            [cell setItemBlock:^(NSInteger tag) {
                self.selectTypeAddress = tag;
            }];
            [cell selTypeByTag:self.selectTypeAddress];
            cell.titleLab.text = self.titleArray[indexPath.row];
            return cell;
        }else if (indexPath.row == 5){
            OpenStoreTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTextViewCell class]) forIndexPath:indexPath];
            cell.titleLab.text = self.titleArray[indexPath.row];
            
            [cell setChangeTextField:^(UITextView * _Nonnull textView) {
                self.detailStr = textView.text;
            }];
            return cell;
        }else{
            OpenStoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreListCell class]) forIndexPath:indexPath];
            cell.titleLab.text = self.titleArray[indexPath.row];
            cell.textField.placeholder = self.tipArray[indexPath.row];
            [cell setValueChangeBlock:^(UITextField * _Nonnull textField) {
                if (indexPath.row == 0) { // 姓
                    
                }else if (indexPath.row == 1){ // 联系方式
                    
                }else if (indexPath.row == 2){ // 场所
                    
                }else{ // 地址
                    
                }

            }];
            return cell;
        }
    }
    OpenStoreTipCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OpenStoreTipCell class]) forIndexPath:indexPath];
    
    return cell;
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
