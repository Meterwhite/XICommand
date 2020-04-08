//
//  XICMethodsBox.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//
#import "XICMethodsBox.h"

@implementation XICMethodsBox
+ (XICColor * _Nonnull (^)(NSString * _Nonnull))hexStrToColor {
    return ^id(NSString *hex){
        @autoreleasepool {
            NSString *nstr = [hex uppercaseString];
            if ([nstr hasPrefix:@"0X"]) nstr = [nstr substringFromIndex:2];
            NSAssert([nstr length] == 6, @"Error color value!");
            NSRange range = NSMakeRange(0, 2);
            NSString *rString = [nstr substringWithRange:range];
            range.location = 2;
            NSString *gString = [nstr substringWithRange:range];
            range.location = 4;
            NSString *bString = [nstr substringWithRange:range];
            unsigned int r, g, b;
            [[NSScanner scannerWithString:rString] scanHexInt:&r];
            [[NSScanner scannerWithString:gString] scanHexInt:&g];
            [[NSScanner scannerWithString:bString] scanHexInt:&b];
            return XICMethodsBox.colorWithRGBA((CGFloat)r/255.f, (CGFloat)g/255.f, (CGFloat)b/255.f, 1.f);
        }
    };
}

+ (NSNumber * _Nonnull (^)(NSString * _Nonnull))pnumStrToNum {
    return ^id(NSString *pnumStr){
        pnumStr = [pnumStr uppercaseString];
        double d = [[pnumStr stringByReplacingOccurrencesOfString:@"P" withString:@"."] doubleValue];
        return [NSNumber numberWithDouble:d];
    };
}

+ (XICColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))colorWithRGBA {
    return ^id(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
#if TARGET_OS_IPHONE || TARGET_OS_TV
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
#elif TARGET_OS_MAC
        return [NSColor colorWithRed:r green:g blue:b alpha:a];
#endif
    };
}
@end
