//
//  XICDKNightVersionColorArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKNightVersionColorArgs.h"
#import "XICMethodsBox.h"

@implementation XICDKNightVersionColorArgs

- (instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs {
    if(self = [super init]) {
        @autoreleasepool {
            NSMutableArray *marr = [NSMutableArray array];
            for (NSString *strv in strs) {
                [marr addObject:XICMethodsBox.hexStrToColor(strv)];
            }
            _colorArray = marr.copy;
        }
    }
    return self;
}

@end
