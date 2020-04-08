//
//  XICDefaultCornerArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultCornerArgs.h"
#import "XICMethodsBox.h"

@implementation XICDefaultCornerArgs

- (nullable instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs {
    if(self = [super init]) {
        _value = XICMethodsBox.pnumStrToNum(strs.firstObject);
    }
    return self;
}

@end
