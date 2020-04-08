//
//  XICDefaultFontArgs.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/7.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultFontArgs.h"
#import "XICMethodsBox.h"

@implementation XICDefaultFontArgs

- (nullable instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs {
    if(self = [super init]) {
        CGFloat s = XICMethodsBox.pnumStrToNum(strs.firstObject).doubleValue;
        if(strs.count == 1) {
            _font = [XICFont systemFontOfSize:s];
        }else if (strs.count == 2) {
            CGFloat w;
            NSString *sw= strs[1];
            if([sw isEqualToString:@"U"]) {
                w = XIC_CROSS_DES(FontWeightUltraLight);
            } else if([sw isEqualToString:@"T"]){
                w = XIC_CROSS_DES(FontWeightThin);
            } else if([sw isEqualToString:@"L"]){
                w = XIC_CROSS_DES(FontWeightLight);
            } else if([sw isEqualToString:@"R"]){
                w = XIC_CROSS_DES(FontWeightRegular);
            } else if([sw isEqualToString:@"M"]){
                w = XIC_CROSS_DES(FontWeightMedium);
            } else if([sw isEqualToString:@"S"]){
                w = XIC_CROSS_DES(FontWeightSemibold);
            } else if([sw isEqualToString:@"B"]){
                w = XIC_CROSS_DES(FontWeightBold);
            } else if([sw isEqualToString:@"H"]){
                w = XIC_CROSS_DES(FontWeightHeavy);
            } else if([sw isEqualToString:@"b"]){
                w = XIC_CROSS_DES(FontWeightBlack);
            }
            _font = [XICFont systemFontOfSize:s weight:0];
        }
    }
    return self;
}

@end
