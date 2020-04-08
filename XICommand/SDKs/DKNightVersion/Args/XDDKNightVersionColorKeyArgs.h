//
//  XDDKNightVersionColorKeyArgs.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@interface XDDKNightVersionColorKeyArgs : NSObject<XICArgs>
@property (nullable,nonatomic,copy,readonly) NSString* key;
@end
