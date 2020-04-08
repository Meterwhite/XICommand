//
//  XICDKColorPicker.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKColorPicker.h"

static Class _clz_DKColorTable;

@implementation XICDKColorPicker

+ (void)initialize {
    if(self != [XICDKColorPicker class]) return;
    _clz_DKColorTable = NSClassFromString(@"DKColorTable");
    NSAssert(_clz_DKColorTable != nil, @"DKColorTable does not exits!");
}

+ (XICColor *_Nonnull(^_Nonnull)(id _Nonnull themeVersion))invokeWithColors:(nonnull NSArray *)colors; {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    id tab = [_clz_DKColorTable performSelector:@selector(sharedColorTable)];
    NSArray *themes = [tab performSelector:@selector(themes)];
#pragma clang diagnostic pop
    return ^(id themeVersion) {
        NSUInteger index = [themes indexOfObject:themeVersion];
        return colors[index];
    };
}

+ (XICColor *_Nonnull(^_Nonnull)(id _Nonnull themeVersion))invokeWithKey:(nonnull NSString *)key {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    id tab = [_clz_DKColorTable performSelector:@selector(sharedColorTable)];
    return [tab performSelector:@selector(pickerWithKey:) withObject:key];
#pragma clang diagnostic pop
}
@end
