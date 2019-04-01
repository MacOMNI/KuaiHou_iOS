//
//  OpenStoreTextViewCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/28.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"
#import "XXTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenStoreTextViewCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet XXTextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *wordNum;

@property (nonatomic, assign) NSInteger maxWordNum;

@property (nonatomic, copy) void (^changeTextField) (UITextView *textView);

@end

NS_ASSUME_NONNULL_END
