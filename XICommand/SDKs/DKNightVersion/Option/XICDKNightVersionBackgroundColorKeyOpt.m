//
//  XICDKNightVersionBackgroundColorKeyOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKNightVersionBackgroundColorKeyOpt.h"
#import "XDDKNightVersionColorKeyArgs.h"
#import "XICDKColorPicker.h"

@implementation XICDKNightVersionBackgroundColorKeyOpt

- (nonnull NSString *)userCmd {
    return @"bgk";
}

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XDDKNightVersionColorKeyArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    if(!tag) return;
        NSAssert([args isKindOfClass:XDDKNightVersionColorKeyArgs.class], @"Error command!");
        id picker = [XICDKColorPicker invokeWithKey:args.key];
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
        [tag performSelector:@selector(dk_setBackgroundColorPicker:) withObject:picker];
    #pragma clang diagnostic pop
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XDDKNightVersionColorKeyArgs class]];
}


@end
