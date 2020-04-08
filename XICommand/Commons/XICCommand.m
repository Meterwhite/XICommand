//
//  XICCommand.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/3.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICCommand.h"

@implementation XICCommand

- (void)invokeWithTag:(id)tag returned:(void (^)(id _Nullable))returnback {
    if([tag isKindOfClass:[NSArray class]]) {
        for (id item in tag) {
            [_opt invokeWithTag:item args:_args returned:returnback];
        }
    } else {
        [_opt invokeWithTag:tag args:_args returned:returnback];
    }
}

@end
