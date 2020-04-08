//
//  XDDKNightVersionColorKeyArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XDDKNightVersionColorKeyArgs.h"

@implementation XDDKNightVersionColorKeyArgs

- (instancetype)initWithStrs:(NSArray<NSString *> *)strs {
    if(self = [super init]) {
        _key = strs.firstObject;        
    }
    return self;
}
@end
