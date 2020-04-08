//
//  XICDefaultBorderArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultBorderArgs.h"
#import "XICMethodsBox.h"

@implementation XICDefaultBorderArgs

- (nullable instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs {
    if(self = [super init]) {
        if(strs.count > 0) {
            _color = XICMethodsBox.hexStrToColor(strs.firstObject);
        }
        if(strs.count > 1) {
            _width = XICMethodsBox.pnumStrToNum(strs[1]);
        }
    }
    return self;
}

@end
