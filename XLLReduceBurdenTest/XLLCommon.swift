//
//  XLLCommon.swift
//  XLLReduceBurdenTest
//
//  Created by xiaoll on 2019/9/26.
//  Copyright © 2019 xiaoll. All rights reserved.
//

import Foundation
import UIKit

let kScreenSize   = UIScreen.main.bounds.size
let kScreenWidth  = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height;

public func kBEI6() -> CGFloat {
    return min(kScreenWidth, kScreenHeight) / 375.0
}
public func kAutoSize(size: CGFloat) -> CGFloat {
    return kBEI6() * size
}
public func kAutoFrame(frame: CGRect) -> CGRect {
    return CGRect(x: (kBEI6() * frame.origin.x), y: (kBEI6() * frame.origin.y), width: (kBEI6() * frame.size.width), height: (kBEI6() * frame.size.height))
}
public func kRGBH(value: Int) -> UIColor {
    return UIColor(red: ((CGFloat)((value & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((value & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(value & 0xFF))/255.0, alpha: 1.0)
}
