//
//  XICDKNightVersionBackgroundColorOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKNightVersionBackgroundColorOpt.h"
#import "XICDKNightVersionColorArgs.h"
#import "XICDKColorPicker.h"

@implementation XICDKNightVersionBackgroundColorOpt

#pragma mark - Protocol
- (nonnull NSString *)userCmd {
    return @"bg";
}

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDKNightVersionColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    if(!tag) return;
    NSAssert([args isKindOfClass:XICDKNightVersionColorArgs.class], @"Error command!");
    id picker = [XICDKColorPicker invokeWithColors:args.colorArray];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [tag performSelector:@selector(dk_setBackgroundColorPicker:) withObject:picker];
#pragma clang diagnostic pop
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDKNightVersionColorArgs class]];
}

@end
