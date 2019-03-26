//
//  MyDynamicsTextCell.m
//  KuaiHou_iOS
//
//  Created by user on 2019/3/26.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#import "MyDynamicsTextCell.h"

@interface MyDynamicsTextCell()
@property(nonatomic,strong)UIView *contentBgView;
@property(nonatomic,strong)YYLabel* contentLabel;
@property(nonatomic,strong)YYLabel* seeMoreLabel;
@property(nonatomic,strong)UIButton* fullBtn;
@end

@implementation MyDynamicsTextCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubView];
    }
    return self;
}
-(void)createSubView {
    _contentBgView = [[UIView alloc] init];
    _contentBgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_contentBgView];
    [_contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 40, 0, 15));
    }];
    _contentLabel = [YYLabel new];
    _contentLabel.numberOfLines = 5;
    _contentLabel.backgroundColor = [UIColor whiteColor];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    UIFont *font = [UIFont systemFontOfSize:15];
    _contentLabel.font = font;
    _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    [self.contentView addSubview:_contentLabel];
    
    _fullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _fullBtn.titleLabel.font = kFont(15);
    [_fullBtn setTitleColor:kMainColor forState:UIControlStateNormal];
    [_fullBtn setTitle:@"收起" forState:(UIControlStateNormal)];
    [_fullBtn addTarget:self action:@selector(fullAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.contentView addSubview:_fullBtn];
}

-(void)fullAction{
    if (self.openBlock) {
        self.openBlock();
    }
}

- (void)addSeeMoreButton {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...全文"];
    [text yy_setFont:[UIFont systemFontOfSize:15] range:text.yy_rangeOfAll];
    text.yy_lineSpacing = 5;
    text.yy_color = [UIColor colorWithHexString:@"#555555"];
    [text yy_setColor:kMainColor  range:[text.string rangeOfString:@"全文"]];
    text.yy_font =_contentLabel.font;
    _seeMoreLabel = [YYLabel new];
    _seeMoreLabel.attributedText = text;
    _seeMoreLabel.userInteractionEnabled = YES;
    kWEAKSELF;
    [_seeMoreLabel setTapActionWithBlock:^{
        NSLog(@"点击了全文");
        if (weakSelf.openBlock) {
            weakSelf.openBlock();
        }
    }];
    [_seeMoreLabel sizeToFit];
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:_seeMoreLabel contentMode:UIViewContentModeCenter attachmentSize:_seeMoreLabel.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentTop];
    _contentLabel.truncationToken = truncationToken;
}

-(void)setDataWithContent:(NSString *)content userId:(NSNumber *)userId isForwarding:(BOOL)forwarding isOpen:(BOOL)isOpen
{
    if ([MyTool isBlankString:content]) {
        content = @"";
    }
    if (forwarding) {
        //        self.contentBgView.backgroundColor = BG_COLOR;
        //        self.contentLabel.backgroundColor  = BG_COLOR;
    } else {
        self.contentBgView.backgroundColor = [UIColor whiteColor];
        self.contentLabel.backgroundColor  = [UIColor whiteColor];
    }
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:content];
    [text yy_setFont:[UIFont systemFontOfSize:15] range:text.yy_rangeOfAll];
    text.yy_lineSpacing = 5;
    text.yy_color = [UIColor colorWithHexString:@"#555555"];;
    
    [self fixText:text isOpen:isOpen];
}

-(void)fixText:(NSAttributedString *)text isOpen:(BOOL)isOpen{
    // 高亮状态的背景
    //    YYTextBorder *highlightBorder = [YYTextBorder new];
    //    highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
    //    highlightBorder.cornerRadius = 3;
    //    highlightBorder.fillColor = [MAINCOLOR colorWithAlphaComponent:0.2];
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenSizeWidth-55, CGFLOAT_MAX);
#pragma mark 这里控制是否显示全文
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
    if (layout.rowCount > 5) {
        if (isOpen) {
            container.maximumNumberOfRows = layout.rowCount;
        }else{
            container.maximumNumberOfRows = 5;
            layout = [YYTextLayout layoutWithContainer:container text:text];
        }
    }
    _contentLabel.attributedText = text;
    _contentLabel.displaysAsynchronously = YES; //开启异步绘制
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_contentLabel.size = layout.textBoundingSize;
        self->_contentLabel.frame = CGRectMake(40, 0, layout.textBoundingSize.width, layout.textBoundingSize.height);
        self->_contentLabel.textLayout = layout;
        [self addSeeMoreButton];
        
    });
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = 22;
    _contentLabel.linePositionModifier = modifier;
    _fullBtn.hidden = !isOpen;
    if (isOpen) {
        _fullBtn.frame = CGRectMake(kScreenSizeWidth - 65, layout.textBoundingSize.height +5 , 50, 20);
    }
}

+(CGFloat)cellHeightWithContent:(NSString *)content isOpen:(BOOL)isOpen
{
    if (content == nil) {
        return 0;
    }
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:content];
    [text yy_setFont:[UIFont systemFontOfSize:15] range:text.yy_rangeOfAll];
    text.yy_lineSpacing = 5;
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenSizeWidth-55, CGFLOAT_MAX);
    //    container.maximumNumberOfRows = 5;
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
    
    if (layout.rowCount > 5) {
        if (isOpen) {
            container.maximumNumberOfRows = layout.rowCount;
            return layout.textBoundingSize.height + 25;
        }else{
            container.maximumNumberOfRows = 5;
            layout = [YYTextLayout layoutWithContainer:container text:text];
        }
    }
    //    NSLog(@"文本高%.f",layout.textBoundingSize.height);
    return layout.textBoundingSize.height + 5;
}

@end
