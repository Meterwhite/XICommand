//
//  XICDefaultFontOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/7.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultFontArgs.h"
#import "XICDefaultFontOpt.h"

@implementation XICDefaultFontOpt

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultFontArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    [tag setFont:args.font];
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDefaultFontArgs class]];
}

- (nonnull NSString *)userCmd {
    return @"font";
}

@end
