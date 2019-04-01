//
//  ManagementStoreTextViewCell.h
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "BaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagementStoreTextViewCell : BaseCell
@property (weak, nonatomic) IBOutlet XXTextView *textView;

@property (nonatomic, copy) void (^changeTextField) (UITextView *textView);

@end

NS_ASSUME_NONNULL_END
