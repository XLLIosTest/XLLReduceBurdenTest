//
//  UIFont+XLL.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "UIFont+XLL.h"

//字体名
#define XLLFontNamePingFangSCUltraLight @"PingFangSC-UltraLight"
#define XLLFontNamePingFangSCThin @"PingFangSC-Thin"
#define XLLFontNamePingFangSCLight @"PingFangSC-Light"
#define XLLFontNamePingFangSCRegular @"PingFangSC-Regular"
#define XLLFontNamePingFangSCMedium @"PingFangSC-Medium"
#define XLLFontNamePingFangSemibold @"PingFangSC-Semibold"
#define XLLFontNameArialBlack @"ArialHebrew-Bold"
#define XLLFontNameStyleJCHEadA @"HeadlineA"
#define XLLFontNameStyleDigitalFont @"DigitalFont"

@implementation UIFont (XLL)

+ (UIFont *)fontWithSize:(CGFloat)size style:(XLLFontStyle)style
{
    UIFont *font;
    switch (style) {
        case XLLFontStyleUltraLight:
            font = [UIFont fontWithName:XLLFontNamePingFangSCUltraLight size:size];
            break;
        case XLLFontStyleThin:
            font = [UIFont fontWithName:XLLFontNamePingFangSCThin size:size];
            break;
        case XLLFontStyleDefault:
        case XLLFontStyleLight:
            font = [UIFont fontWithName:XLLFontNamePingFangSCLight size:size];
            break;
        case XLLFontStyleRegular:
            font = [UIFont fontWithName:XLLFontNamePingFangSCRegular size:size];
            break;
        case XLLFontStyleMedium:
            font = [UIFont fontWithName:XLLFontNamePingFangSCMedium size:size];
            break;
        case XLLFontStyleSemibold:
            font = [UIFont fontWithName:XLLFontNamePingFangSemibold size:size];
            break;
        case XLLFontStyleArialBlack:
            font = [UIFont fontWithName:XLLFontNameArialBlack size:size];
            break;
        case XLLFontStyleJCHEadA:
            font = [UIFont fontWithName:XLLFontNameStyleJCHEadA size:size];
            break;
        case XLLFontStyleDigitalFont:
            font = [UIFont fontWithName:XLLFontNameStyleDigitalFont size:size];
        default:
            font = [UIFont fontWithName:XLLFontNamePingFangSCLight size:size];
    }
    if(!font)   //不支持苹方字体的iOS9以下系统，使用缺省字体
        font = [UIFont systemFontOfSize:size];
    return font;
}

@end
