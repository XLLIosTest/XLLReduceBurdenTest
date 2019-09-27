//
//  UIFont+XLL.h
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XLLFontStyle) {
    XLLFontStyleDefault = 0,
    XLLFontStyleUltraLight,
    XLLFontStyleThin,
    XLLFontStyleLight,
    XLLFontStyleRegular,
    XLLFontStyleMedium,
    XLLFontStyleSemibold,
    XLLFontStyleArialBlack,
    XLLFontStyleJCHEadA,
    XLLFontStyleDigitalFont,
};

@interface UIFont (XLL)

+ (UIFont *)fontWithSize:(CGFloat)size style:(XLLFontStyle)style;

@end

NS_ASSUME_NONNULL_END
