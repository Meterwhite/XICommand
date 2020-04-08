//
//  XICDefaultBorderArgs.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

/// color + [width(3.14 == 3p14)]
@interface XICDefaultBorderArgs : NSObject<XICArgs>

@property (nullable,nonatomic,strong) XICColor  *color;

@property (nullable,nonatomic,strong) NSNumber  *width;

@end

