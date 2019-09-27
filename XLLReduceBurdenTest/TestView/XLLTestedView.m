//
//  XLLTestedView.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "XLLTestedView.h"
#import "XLLReduceBurdenTest-Swift.h"

@interface XLLTestedView () <UICollectionViewDelegate>

@end

@implementation XLLTestedView

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
        NSLog(@"%@", self.myInfo);
    }
    return self;
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
    }
    return _collectionView;
}

@end
