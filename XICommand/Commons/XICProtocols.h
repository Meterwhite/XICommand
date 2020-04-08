//
//  XICProtocols.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/3/31.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDefined.h"

@class XICCommand;

/**
 * Implement the protocol and add it to the ‘XICDocument.h’ file.
 * 实施该协议并将其添加到“ XICDocument.h”文件中。
 *
 */
@protocol XICDocument <NSObject>

@end

/**
 * Option arguments
 */
@protocol XICArgs <NSObject>
@required
/// Initialize by string
/// @param strs Split independent parameter strings.切分的字符串参数.
- (nullable instancetype)initWithStrs:(nonnull NSArray<NSString *> *)strs;
@end

/**
 * Command options
 */
@protocol XICOption <NSObject>
@required
/**
 * All class of registed args.参数类型的数组
 */
+ (nonnull NSArray <Class>*)kindsOfArgs;
/**
 * The name of option.命令
 */
- (nonnull NSString *)userCmd;
/**
 * Invoke this option.调用
 */
- (void)invokeWithTag:(nonnull id)tag args:(nonnull id<XICArgs>)args returned:(void(^ _Nullable)(id _Nullable ret))returnback;
@end

/**
 * Command SDK
 */
@protocol XICSDK <NSObject>
@required
/**
 * Each object of SDK is a singleton.
 */
+ (nonnull instancetype)sharedSDK;
/**
 * The name of command.命令
 */
- (nonnull NSString *)userCmd;
/// Identity class.Determine whether the SDK is available.关键类
- (nonnull Class)idc;
/// SDK identity.Usually the name of the library, like 'AFNetWorking'.SDK名称
- (nonnull NSString *)identity;
/// The collection holds all Option objects.该集合持有着SDK下所有Option对象
- (nonnull NSDictionary <NSString *, id<XICOption>> *)optionMap;
@end
