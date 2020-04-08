//
//  XICDKNightVersionSDK.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKNightVersionBackgroundColorKeyOpt.h"
#import "XICDKNightVersionBackgroundColorOpt.h"
#import "XICDKNightVersionTextColorKeyOpt.h"
#import "XICDKNightVersionTextColorOpt.h"
#import "XICDKNightVersionSDK.h"

static XICDKNightVersionSDK *_shared;

@interface XICDKNightVersionSDK ()
@property (nullable,nonatomic,strong) NSDictionary *actMap;
@end

@implementation XICDKNightVersionSDK
/**
 * dkdo = DKNightVersion do
 */
- (nonnull NSString *)userCmd {
    return @"dkdo";
}

- (NSDictionary<NSString *,id<XICOption>> *)optionMap{
    if(!_actMap){
        NSArray *acts = [NSArray arrayWithObjects:
                         [XICDKNightVersionBackgroundColorKeyOpt new],
                         [XICDKNightVersionBackgroundColorOpt new],
                         [XICDKNightVersionTextColorKeyOpt new],
                         [XICDKNightVersionTextColorOpt new],
                         nil];
        NSMutableDictionary *md = [NSMutableDictionary dictionary];
        for (id<XICOption> item in acts) {
            md[item.userCmd] = item;
        }
        _actMap = md.copy;
    }
    return _actMap;
}

- (nonnull NSString *)identity {
    return @"DKNightVersion";
}

- (nonnull Class)idc {
    return NSClassFromString(@"DKNightVersionManager");
}

#pragma mark - shared
+ (nonnull instancetype)sharedSDK {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[XICDKNightVersionSDK alloc] init];
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
