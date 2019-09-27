//
//  XLLMacros.h
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

#ifndef XLLMacros_h
#define XLLMacros_h

#define Screen_Size    [[UIScreen mainScreen] bounds].size
#define Screen_Width   Screen_Size.width
#define Screen_Height  Screen_Size.height

#define BEI6 (MIN(Screen_Width, Screen_Height) / 375)
#define AutoSize(size) ((size) * BEI6)
#define AutoFrame(frame) CGRectMake(frame.origin.x*BEI6,frame.origin.y*BEI6, frame.size.width*BEI6, frame.size.height*BEI6)

#define RGBH(value) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0]


#endif /* XLLMacros_h */
