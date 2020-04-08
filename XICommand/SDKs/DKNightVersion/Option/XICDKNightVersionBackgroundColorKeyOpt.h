//
//  XICDKNightVersionBackgroundColorKeyOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@class XDDKNightVersionColorKeyArgs;

@interface XICDKNightVersionBackgroundColorKeyOpt : NSObject<XICOption>
- (void)invokeWithTag:(nonnull id)tag args:(nonnull XDDKNightVersionColorKeyArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;
@end

