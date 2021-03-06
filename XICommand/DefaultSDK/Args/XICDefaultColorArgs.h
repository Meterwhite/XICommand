//
//  XICDefaultColorArgs.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//


#import "XICProtocols.h"

@interface XICDefaultColorArgs : NSObject<XICArgs>

@property (nullable,nonatomic,copy) NSArray <XICColor *>* colors;

@end
