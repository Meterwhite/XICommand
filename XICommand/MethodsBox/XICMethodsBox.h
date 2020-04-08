//
//  XICMethodsBox.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefined.h"

NS_ASSUME_NONNULL_BEGIN

#define XICStaticBlock @property (nonatomic,copy,class,readonly)

@interface XICMethodsBox : NSObject
/// 0x00FFee or 00FFee
XICStaticBlock XICColor *(^hexStrToColor)(NSString* hex);
/// 3p14 -> 3.14(@double)
XICStaticBlock NSNumber *(^pnumStrToNum)(NSString* hex);
/// [0,255]
XICStaticBlock XICColor *(^colorWithRGBA)(CGFloat r, CGFloat g, CGFloat b, CGFloat a);
@end

NS_ASSUME_NONNULL_END
