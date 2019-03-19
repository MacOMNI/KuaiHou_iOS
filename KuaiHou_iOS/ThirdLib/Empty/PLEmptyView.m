//
//  PLEmptyConfig.h
//  MangoInteraction
//
//  Created by 郭子豪 Email 862124770@qq.com on 16/6/28.

#import "PLEmptyView.h"
#import "NSString+Size.h"
@interface PLEmptyView()
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *subTitleLabel;
@property (nonatomic) UIButton *button;
@end
@implementation PLEmptyView
- (instancetype)initWithConfig:(PLEmptyConfig *)config height:(CGFloat)height{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, height)];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
        self.emptyConfig = config;
        [self setup];
    }
    return self;
}

+(PLEmptyView *)emptyWithConfig:(PLEmptyConfig *)config height:(CGFloat)height
{
    PLEmptyView* emptyView = [[PLEmptyView alloc] initWithConfig:config height:height];
    return emptyView;
}

+(PLEmptyView *)emptyWithConfig:(PLEmptyConfig *)config height:(CGFloat)height emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock
{
    PLEmptyView* emptyView = [[PLEmptyView alloc] initWithConfig:config height:height];
    emptyView.emptyBtnTitle = btnTitle;
     emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;
}

+(PLEmptyView *)emptyWithHeight:(CGFloat)height configBlock:(void (^)(PLEmptyConfig *))configBlock
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    !configBlock ?: configBlock(config);
     PLEmptyView* emptyView = [[PLEmptyView alloc] initWithConfig:config height:height];
    return emptyView;
}

+(PLEmptyView *)emptyWithHeight:(CGFloat)height configBlock:(void (^)(PLEmptyConfig *))configBlock emptyBtnTitle:(NSString *)btnTitle emptyBtnActionBlock:(void (^)(void))btnActionBlock
{
    PLEmptyConfig *config = [PLEmptyConfig new];
    !configBlock ?: configBlock(config);
    PLEmptyView* emptyView = [[PLEmptyView alloc] initWithConfig:config height:height];
    emptyView.emptyBtnTitle = btnTitle;
    emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;

}
#pragma mark-判断是否有自定义配置
- (PLEmptyConfig *)emptyConfig
{
    return _emptyConfig?:[PLEmptyConfig new];
}

- (NSString *)emptyBtnTitle
{
    return _emptyBtnTitle?: @"重新加载";
}

- (void)setup{
    [self setupImageView];
    [self setupTitleLabel];
    [self setupSubTitleLabel];
    [self setupButton];
}
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
      //  _imageView.backgroundColor = [UIColor colorWithRed:187.0/255.0 green:187.0/255.0 blue:187.0/255.0 alpha:1];
      //  _imageView.layer.cornerRadius = 119/2;
       // _imageView.clipsToBounds = YES;
    //    _imageView.contentMode = UIViewContentModeCenter;
        _imageView.userInteractionEnabled = NO;
        [self addSubview:_imageView];
    }
    return _imageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:27.0];
        _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel)
    {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _subTitleLabel.backgroundColor = [UIColor clearColor];
        
        _subTitleLabel.font = [UIFont systemFontOfSize:17.0];
        _subTitleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subTitleLabel.numberOfLines = 0;
        
        [self addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.layer.cornerRadius = 5;
        _button.layer.borderColor = [UIColor clearColor].CGColor;
        _button.layer.borderWidth = 1;
        _button.clipsToBounds = YES;
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
    return _button;
}

-(void)setupImageView
{
    self.imageView.image = _emptyConfig.emptyImage;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.emptyConfig.emptyImageTopMargin));
        make.size.mas_equalTo(self.emptyConfig.emptyImageSize);
        make.centerX.equalTo(@0);
    }];
}

-(void)setupTitleLabel
{
    self.titleLabel.text = _emptyConfig.emptyTitle;
    _titleLabel.font = _emptyConfig.emptyTitleFont;
    [_titleLabel setTextColor:_emptyConfig.emptyTitleColor];
    CGSize titletextSize = CGSizeMake(self.frame.size.width, 200);
    NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:_titleLabel.font forKey:NSFontAttributeName];
    CGRect rect = [_titleLabel.text boundingRectWithSize:titletextSize
                                                 options:option
                                              attributes:attributes
                                                 context:nil];
    titletextSize = rect.size;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(_emptyConfig.emptyTitleTopMargin);
        make.width.equalTo([NSNumber numberWithFloat:self.frame.size.width]);
        make.centerX.equalTo(@0);
        make.height.equalTo([NSNumber numberWithInteger:titletextSize.height+1]);
    }];
}

-(void)setupSubTitleLabel{
    self.subTitleLabel.text = _emptyConfig.emptySubtitle;
    _subTitleLabel.font = _emptyConfig.emptySubTitleFont;
    [_subTitleLabel setTextColor:_emptyConfig.emptySubTitleColor];
    CGSize subTitletextSize = CGSizeMake(self.frame.size.width, 200);
    NSStringDrawingOptions subTitleoption = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *subTitleattributes = [NSDictionary dictionaryWithObject:_subTitleLabel.font forKey:NSFontAttributeName];
    CGRect subTitlerect = [_titleLabel.text boundingRectWithSize:subTitletextSize
                                                       options:subTitleoption
                                                    attributes:subTitleattributes
                                                       context:nil];
    subTitletextSize = subTitlerect.size;
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(self.emptyConfig.emptySubTitleTopMargin);
        make.width.equalTo([NSNumber numberWithFloat:self.frame.size.width]);
         make.centerX.equalTo(@0);
        make.height.equalTo([NSNumber numberWithInteger:subTitletextSize.height+1]);
    }];
}

-(void)setupButton{
    [self.button setTitle:@"刷新" forState:UIControlStateNormal];
    [_button setTitleColor:_emptyConfig.emptyBtnTileColor forState:UIControlStateNormal];
    [_button.titleLabel setFont:_emptyConfig.emptyBtnTitleFont];
    [_button setBackgroundColor:_emptyConfig.emptyBtnBgColor];
    if (_emptyConfig.emptyBtnWidth<=0||_emptyConfig.emptyBtnHeight<=0) {
        self.button.hidden = YES;
    }else
    {
        self.button.hidden = NO;
    }
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        if ([MyTool isBlankString:self.emptyConfig.emptySubtitle]) {
             make.top.equalTo(self.titleLabel.mas_bottom).offset(self.emptyConfig.emptyBtnTopMargin);
        }else
        {
        make.top.equalTo(self.subTitleLabel.mas_bottom).offset(self.emptyConfig.emptyBtnTopMargin);
        }
        make.centerX.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(self.emptyConfig.emptyBtnWidth==0?110:self.emptyConfig.emptyBtnWidth,self.emptyConfig.emptyBtnHeight==0?30.5:self.emptyConfig.emptyBtnHeight));
    }];
}
-(void)didTapButton:(UIButton*)sender
{
    NSLog(@"点击");
    [self removeFromSuperview];
    !self.emptyBtnActionBlock ?: self.emptyBtnActionBlock();
}
- (void)destroy
{
    [self removeFromSuperview];
}
@end
