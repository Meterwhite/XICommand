//
//  View+XICWindow.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/20.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefined.h"

/// Command window needs to be displayed in this way.
#if TARGET_OS_IPHONE || TARGET_OS_TV

@interface UIResponder (XICWindow)

@property (nullable,nonatomic,copy) IBInspectable NSString *CMDWindow;

@end

#elif TARGET_OS_MAC
@interface NSResponder (XICWindow)

@property (nullable,nonatomic,copy) IBInspectable NSString *CMDWindow;

@end
#endif
