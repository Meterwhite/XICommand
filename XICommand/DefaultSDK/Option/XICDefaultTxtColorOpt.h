//
//  XICDefaultTxtColorOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/7.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

@class XICDefaultColorArgs;

@interface XICDefaultTxtColorOpt : NSObject<XICOption>

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;

@end
