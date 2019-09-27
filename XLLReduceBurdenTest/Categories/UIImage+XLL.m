//
//  UIImage+XLL.m
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#import "UIImage+XLL.h"

@implementation UIImage (XLL)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(1, 1);
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
