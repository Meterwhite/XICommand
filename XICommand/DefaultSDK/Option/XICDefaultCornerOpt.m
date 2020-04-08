//
//  XICDefaultCornerOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultCornerOpt.h"

@implementation XICDefaultCornerOpt

- (nonnull NSString *)userCmd {
    return @"corner";
}

- (void)invokeWithTag:(nonnull XICView*)tag args:(nonnull XICDefaultCornerArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    if(![[tag layer] masksToBounds]) {
        [[tag layer] setMasksToBounds:YES];
    }
    [[tag layer] setCornerRadius:args.value.doubleValue];
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDefaultCornerArgs class]];
}

@end
