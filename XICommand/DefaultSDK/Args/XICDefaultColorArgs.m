//
//  XICDefaultColorArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultColorArgs.h"
#import "XICMethodsBox.h"

@implementation XICDefaultColorArgs

- (nullable instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs {
    if(self = [super init]) {
        NSMutableArray *colors = [NSMutableArray array];
        for (NSString *item in strs) {
            [colors addObject:XICMethodsBox.hexStrToColor(item)];
        }
        _colors = [colors copy];
    }
    return self;
}

@end
