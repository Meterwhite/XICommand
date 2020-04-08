//
//  XICDefaultBorderOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultBorderArgs.h"
#import "XICProtocols.h"

@interface XICDefaultBorderOpt : NSObject<XICOption>

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultBorderArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;

@end
