//
//  View+XICWindow.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/20.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICRuntimeWork.h"
#import "Xib+XICSupport.h"

@implementation XICResponder (XICWindow)

- (NSString *)CMDWindow {
    return [XICRuntimeWork windowCMDForObject:self];
}

- (void)setCMDWindow:(NSString *)cmd {
    if([cmd containsString:XICCodeCtrlRet]) {
        /// filter : `ctrl + return`
        cmd = [cmd stringByReplacingOccurrencesOfString:XICCodeCtrlRet withString:XICCodeNLine];
    }
    [XICRuntimeWork setWindowCMD:cmd forObject:self];
}

@end
