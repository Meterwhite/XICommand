//
//  XICDefaultBorderOpt.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultBorderOpt.h"
#import "XICMethodsBox.h"

@implementation XICDefaultBorderOpt

- (nonnull NSString *)userCmd {
    return @"border";
}

- (void)invokeWithTag:(XICView *)tag args:(XICDefaultBorderArgs *)args returned:(void (^)(id _Nullable))returnback {
    if(![[tag layer] masksToBounds]) {
        [[tag layer] setMasksToBounds:YES];
    }
    [[tag layer] setBorderColor:args.color.CGColor];
    if(args.width) {
        [[tag layer] setBorderWidth:args.width.doubleValue];
    }
}

+ (nonnull NSArray<Class> *)kindsOfArgs {
    return @[[XICDefaultBorderArgs class]];
}

@end
