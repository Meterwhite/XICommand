//
//  XICDefaultTxtColorOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/7.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultTxtColorOpt.h"
#import "XICDefaultColorArgs.h"

@implementation XICDefaultTxtColorOpt

- (void)invokeWithTag:(nonnull id)tag args:(nonnull XICDefaultColorArgs *)args returned:(void (^ _Nullable)(id _Nullable))returnback {
    if([tag respondsToSelector:@selector(setTextColor:)]) {
        [tag setTextColor:args.colors.firstObject];
    }
#if TARGET_OS_IPHONE || TARGET_OS_TV
    else if([tag respondsToSelector:@selector(setTitleColor:forState:)]) {
        [tag setTitleColor:args.colors.firstObject forState:0];
    }
#endif
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDefaultColorArgs class]];
}

- (nonnull NSString *)userCmd {
    return @"txtcolor";
}

@end
