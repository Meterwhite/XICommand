//
//  XICDefaultCornerArgs.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

/// 1.23 = 1p23
@interface XICDefaultCornerArgs : NSObject<XICArgs>

@property (nullable,nonatomic,strong) NSNumber* value;

@end
