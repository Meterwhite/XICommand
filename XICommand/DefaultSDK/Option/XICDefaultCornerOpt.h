//
//  XICDefaultCornerOpt.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultCornerArgs.h"
#import "XICProtocols.h"

@interface XICDefaultCornerOpt : NSObject<XICOption>

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultCornerArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback;

@end
