//
//  XICDefaultSDK.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefaultTxtColorOpt.h"
#import "XICDefaultBGColorOpt.h"
#import "XICDefaultBorderOpt.h"
#import "XICDefaultCornerOpt.h"
#import "XICDefaultHiddenOpt.h"
#import "XICDefaultFontOpt.h"
#import "XICDefaultSDK.h"
#import "XICDocument.h"

static XICDefaultSDK *_shared;

@interface XICDefaultSDK ()
@property (nullable,nonatomic,strong) NSDictionary *optMap;
@end

@implementation XICDefaultSDK
/**
 * sudo = super user do
 */
- (nonnull NSString *)userCmd {
    return @"sudo";
}

- (NSDictionary<NSString *,id<XICOption>> *)optionMap{
    if(!_optMap){
        NSArray *acts = [NSArray arrayWithObjects:
                         [XICDefaultTxtColorOpt new],
                         [XICDefaultBGColorOpt new],
                         [XICDefaultBorderOpt new],
                         [XICDefaultCornerOpt new],
                         [XICDefaultHiddenOpt new],
                         [XICDefaultFontOpt new],
                         nil];
        NSMutableDictionary *md = [NSMutableDictionary dictionary];
        for (id<XICOption> item in acts) {
            md[item.userCmd] = item;
        }
        _optMap = md.copy;
    }
    return _optMap;
}

- (nonnull NSString *)identity {
    return @"XICommand";
}

- (nonnull Class)idc {
    return [XICDefaultSDK class];
}

#pragma mark - shared
+ (nonnull instancetype)sharedSDK {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[XICDefaultSDK alloc] init];
    });
    return _shared;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [super allocWithZone:zone];
    });
    return _shared;
}

- (id)copyWithZone:(NSZone *)zone {
    return _shared;
}
@end
