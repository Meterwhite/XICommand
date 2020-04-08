//
//  XICDefaultHiddenOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//


#import "XICDefaultHiddenOpt.h"

@implementation XICDefaultHiddenOpt

- (nonnull NSString *)userCmd {
    return @"hidden";
}

- (void)invokeWithTag:(nonnull id)tag args:(nonnull id<XICArgs>)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    [tag setHidden:YES];
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[];
}

@end
