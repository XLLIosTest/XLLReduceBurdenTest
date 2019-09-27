//
//  XLLTestView.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "XLLTestView.h"

@interface XLLTestCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *item;

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, copy, readonly) NSString *myInfo;

@end

@implementation XLLTestCollectionViewCell
@dynamic myInfo;

#pragma mark - life circle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - private methods
- (void)setupSubviews
{
    [self.contentView addSubview:self.dayLabel];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.mas_equalTo(-AutoSize(15));
    }];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.mas_equalTo(AutoSize(15));
    }];
}

- (NSString *)myInfo
{
    return @"CoderXLL";
}

#pragma mark - setter
- (void)setItem:(NSString *)item
{
    _item = [item copy];
    NSMutableAttributedString *originPriceAttr = [[NSMutableAttributedString alloc] initWithString:@"¥"];
    NSAttributedString *priceAttr = [[NSAttributedString alloc] initWithString:item attributes:@{NSFontAttributeName: [UIFont fontWithSize:AutoSize(26) style:XLLFontStyleMedium]}];
        [originPriceAttr appendAttributedString:priceAttr];
    self.priceLabel.attributedText = originPriceAttr;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.layer.cornerRadius = AutoSize(8.f);
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:248/255.0 blue:239/255.0 alpha:1];
}

#pragma mark - lazy loading
- (UILabel *)dayLabel
{
    if (_dayLabel == nil)
    {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textColor = RGBH(0x666666);
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.font = [UIFont fontWithSize:AutoSize(13) style:XLLFontStyleRegular];
        _dayLabel.text = @"一天";
    }
    return _dayLabel;
}

- (UILabel *)priceLabel
{
    if (_priceLabel == nil)
    {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = RGBH(0xF5440F);
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont fontWithSize:AutoSize(16) style:XLLFontStyleRegular];
    }
    return _priceLabel;
}

@end

@interface XLLTestView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *sureBtn;

@end

@implementation XLLTestView

#pragma mark - life circle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder])
    {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - private methods
- (void)setupSubviews
{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(AutoSize(20));
        make.centerX.mas_equalTo(0);
    }];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(AutoSize(35));
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(Screen_Width);
        make.bottom.mas_equalTo(AutoSize(-70));
    }];
    [self addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(AutoSize(-11));
        make.left.mas_equalTo(AutoSize(20));
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(AutoSize(42));
    }];
}

#pragma mark - collectionView delegate/dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemHeight = collectionView.frame.size.height;
    return CGSizeMake(itemHeight * 101 / 125.0, itemHeight);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XLLTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XLLTestCollectionViewCell.class) forIndexPath:indexPath];
    cell.item = [NSString stringWithFormat:@"%zd", (indexPath.item + 1) * 10];
    return cell;
}

#pragma mark - lazy loading
- (UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithSize:AutoSize(18) style:XLLFontStyleMedium];
        _titleLabel.text = @"我是标题";
    }
    return _titleLabel;
}

- (UIButton *)sureBtn
{
    if (_sureBtn == nil)
    {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setBackgroundImage:[UIImage imageWithColor:RGBH(0xFF832F)] forState:UIControlStateNormal];
        [_sureBtn setBackgroundImage:[UIImage imageWithColor:[RGBH(0xFF832F) colorWithAlphaComponent:0.5]] forState:UIControlStateDisabled];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:@"确定选择" forState:UIControlStateNormal];
        [_sureBtn setTitle:@"请选择选项" forState:UIControlStateDisabled];
        _sureBtn.titleLabel.font = [UIFont fontWithSize:AutoSize(17) style:XLLFontStyleMedium];
        _sureBtn.layer.cornerRadius = AutoSize(21);
        _sureBtn.clipsToBounds = YES;
        _sureBtn.enabled = NO;
    }
    return _sureBtn;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, AutoSize(79), 0, AutoSize(79));
        layout.minimumLineSpacing = AutoSize(16);
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:XLLTestCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(XLLTestCollectionViewCell.class)];
    }
    return _collectionView;
}

@end
