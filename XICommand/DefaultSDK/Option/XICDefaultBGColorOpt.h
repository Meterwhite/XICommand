//
//  XICDefaultBGColorOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@class XICDefaultColorArgs;

/// Non args
@interface XICDefaultBGColorOpt : NSObject<XICOption>

- (void)invokeWithTag:(nonnull XICView *)tag args:(nonnull XICDefaultColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;

@end
