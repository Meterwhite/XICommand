//
//  XICDKNightVersionTextColorOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/2.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@class XICDKNightVersionColorArgs;

@interface XICDKNightVersionTextColorOpt : NSObject<XICOption>

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDKNightVersionColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;

@end
