//
//  XICCommand.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/3.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

/// A command.
@interface XICCommand : NSObject

/// Outlet name, property name, key for kvc.`nil` if the window. command.连线名，属性名。窗口命令时为空。
@property (nullable,nonatomic,copy)     NSString        *outlet;
/// The option object.
@property (nullable,nonatomic,strong)   id<XICOption>   opt;
/// The arguments object.
@property (nullable,nonatomic,strong)   id<XICArgs>     args;


/// Invoke comment
/// @param tag XArray,XView,XViewController
/// @param returnback Retain the ability to return results asynchronously.保留异步返回结果的能力。
- (void)invokeWithTag:(nonnull id)tag returned:(void(^ _Nullable)(id _Nullable ret))returnback;

@end
