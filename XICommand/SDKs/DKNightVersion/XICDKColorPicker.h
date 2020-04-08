//
//  XICDKColorPicker.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/1.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefined.h"

@interface XICDKColorPicker : NSObject
+ (XICColor *_Nonnull(^_Nonnull)(id _Nonnull themeVersion))invokeWithColors:(nonnull NSArray *)colors;
+ (XICColor *_Nonnull(^_Nonnull)(id _Nonnull themeVersion))invokeWithKey:(nonnull NSString *)key;
@end

