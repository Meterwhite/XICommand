//
//  XICRuntimeWork.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/3/31.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefined.h"

@interface XICRuntimeWork : NSObject
+ (nonnull instancetype)shared;
/// Changes from other runtimes can be reloaded if they have potential impact.来自其他对运行时的修改，如果有潜在的影响，可以重新加载.
- (void)reload;
@end
