//
//  ManagementStoreConfigCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/4/1.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "ManagementStoreConfigCell.h"

@implementation ManagementStoreConfigCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configByImageName:(NSString *)imageStr title:(NSString *)title detail:(NSString *)detail discount:(NSString *)discount price:(NSString *)price{
    [MyTool sd_ImageView:self.imageView URLStr:imageStr placeholderImage:@""];
    self.titleLab.text = title;
    self.detaildLab.text = detail;
    self.discountLab.text = discount;
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:price attributes:attribtDic];
    self.priceLab.attributedText = attribtStr;
}

@end
