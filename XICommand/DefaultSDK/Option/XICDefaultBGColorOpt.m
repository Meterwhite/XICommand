//
//  XICDefaultBGColorOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultBGColorOpt.h"
#import "XICDefaultColorArgs.h"

@implementation XICDefaultBGColorOpt

- (nonnull NSString *)userCmd {
    return @"bgcolor";
}

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    [tag setBackgroundColor:args.colors.firstObject];
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDefaultColorArgs class]];
}

@end
