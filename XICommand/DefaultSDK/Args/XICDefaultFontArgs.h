//
//  XICDefaultFontArgs.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/7.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@interface XICDefaultFontArgs : NSObject<XICArgs>

@property (nullable,nonatomic,strong) XICFont* font;

@end

